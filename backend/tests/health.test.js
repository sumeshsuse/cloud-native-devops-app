const request = require('supertest');
const app = require('../server');

describe('GET /health', () => {
  it('returns status healthy', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe('healthy');
  });
});

describe('GET /api/hello', () => {
  it('returns a message and timestamp', async () => {
    const res = await request(app).get('/api/hello');
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe('Hello from Backend!');
  });
});