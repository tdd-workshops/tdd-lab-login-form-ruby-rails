# Login Form Demo

This repository contains a simple web application written in Ruby on Rails.

## Workshop

The product owner is very happy with the application, but would like some enhancements.

### User Story

> As a **User**, <br>
**When** I login with password which is too short.<br>
**Then** I should see an alert telling me my password is too short.

Acceptance Criteria:

- Error alert should be visible when the password is too short.
- This should be a server-side implementation.
- There should be additional automated test coverage.

---

## Running the application

Open this folder in your terminal app. And run these commands in the terminal. This app assumes you have Ruby 2.6.6 installed.

1. Install dependencies:

    ```
    bundle install
    yarn install
    ```

2. Start the app:

    ```
    bundle exec rails server
    ```

    You can open this url in your browser to view the app: <http://localhost:3000>

3. To run the test:

    ```
    bundle exec rspec
    ```

4. To run the linter:

    ```
    bundle exec rubocop
    ```

5. To fix linting issues:

    ```
    bundle exec rubocop -A
    ```

## Architecture

To be updated

## Routes

1. `GET /`

    This is the home page. The login form is also here.

2. `GET /signup`

    This is the registration form.

3. `POST /signup`

    Sign up for new user account.

3. `POST /users`

    This is how you login to the app. You will need to login with `email` and `password`.

    The default email is `demo@example.com` and password is `demo1234`.

3. `GET /users/welcome`

    Landing page after you have successfully logged in with the correct credentials.

4. `GET /users/logout`

    URL for logging out of the application.
