from flask import Flask, render_template
from flask.ext.socketio import SocketIO, emit

app = Flask(__name__)
app.config['DEBUG'] = True
socketio_server = SocketIO(app)

@app.route('/')
def serve_html():
    return render_template('memegame.html')

@app.route('/js/socket.io.js')
def serve_socket_io_lib():
    return render_template('js/socket.io.js')

@app.route('/js/angular.js')
def serve_angular_lib():
    return render_template('js/angular.js')

@app.route('/js/app.js')
def serve_app():
    return render_template('js/app.js')

@socketio_server.on('browser_contributing_an_image_url')
def handle_browser_contributing_an_image_url(json_from_browser):
    global current_numeric_id
    grid_id = 'img{0}'.format(current_numeric_id)
    url = json_from_browser['url']
    if url.startswith('http://cdn.meme.am/instances/500x/') and url.endswith('.jpg'):
        current_numeric_id = (current_numeric_id + 1) % 8
        emit('server_broadcasting_new_image_url', { 'grid_id': grid_id, 'url': url }, broadcast=True)
    else:
        emit('server_signalling_bad_url', {})

if __name__ == '__main__':
    global current_numeric_id
    current_numeric_id = 0

    socketio_server.run(app, host='0.0.0.0')

