async function callBackend() {
  const responseDiv = document.getElementById('response');
  responseDiv.style.display = 'block';
  responseDiv.innerHTML = 'Loading...';

  try {
    const response = await fetch('http://backend:5050/api/hello');;
    const data = await response.json();
    responseDiv.innerHTML = `
      <p>✅ Message: ${data.message}</p>
      <p>🕐 Time: ${data.timestamp}</p>
    `;
  } catch (error) {
    responseDiv.innerHTML = '❌ Backend not reachable!';
  }
}
