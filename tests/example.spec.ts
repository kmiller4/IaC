import { test, expect } from '@playwright/test';

// an end-to-end or smoke test is run after your API gets deployed. It uses the real, live URL of your API and makes sure that it provides the expected responses to a test call. 
// This indirectly verifies that 1. your Lambda code is working as expected, 2. permissions and other config are correct between your gateway, your function, and your database,
// and 3. all your resources have been deployed successfully.

// shows that page loads and has my name on it
test('has title', async ({ page }) => {
  await page.goto('https://kyle-miller.net');
  await expect(page).toHaveTitle(/Kyle Miller/);
});

// shows that the visitor counter API returns a number to the front-end
test('visitor counter', async ({ page }) => {
  await page.goto('https://kyle-miller.net/');
  await expect(page.getByRole('heading', { name: 'Visitor Count' })).toContainText(/[0-9]/);
});