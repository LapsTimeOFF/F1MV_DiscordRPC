// Modules to control application life and create native browser window
const { app, BrowserWindow } = require('electron');

function createWindow() {
	const mainWindow = new BrowserWindow({
		width: 800,
		height: 600,
		webPreferences: {
			nodeIntegration: true,
			contextIsolation: false,
			nativeWindowOpen: true,
			enableRemoteModule: true,
			sandbox: false,
			nodeIntegrationInSubFrames: true, //for subContent nodeIntegration Enable
		},
	});

	mainWindow.loadFile('index.html');
}

app.whenReady().then(() => {
	createWindow();

	app.on('activate', function () {
		if (BrowserWindow.getAllWindows().length === 0) createWindow();
	});
});

app.on('window-all-closed', function () {
	if (process.platform !== 'darwin') app.quit();
});
