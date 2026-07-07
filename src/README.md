# Mergington High School Activities API

This repository now uses an explicit app scaffold so the current activities experience can keep working while the larger Campus Club feature set is built.

## Architecture

- `backend/` contains the FastAPI application and API routes.
- `frontend/` contains the static web client served by the backend.
- `database/` contains the initial relational schema draft for future persistence.
- `app.py` remains the local development entrypoint.

## Current Vertical Slice

The current end-to-end slice is still the activities workflow:

- View all available extracurricular activities
- Sign up for an activity
- Unregister a participant from an activity

The runtime behavior is unchanged, but the code layout now matches the intended backend/frontend/database split.

## Getting Started

1. Install the dependencies:

   ```
   pip install -r ../requirements.txt
   ```

2. Run the application from the `src/` directory:

   ```
   python app.py
   ```

3. Open your browser and go to:
   - App: http://localhost:8000/
   - API documentation: http://localhost:8000/docs
   - Alternative documentation: http://localhost:8000/redoc

## API Endpoints

| Method | Endpoint                                                                | Description                                                         |
| ------ | ----------------------------------------------------------------------- | ------------------------------------------------------------------- |
| GET    | `/activities`                                                           | Get all activities with their details and current participant count |
| POST   | `/activities/{activity_name}/signup?email=student@mergington.edu`       | Sign up for an activity                                             |
| DELETE | `/activities/{activity_name}/unregister?email=student@mergington.edu`   | Unregister a student from an activity                               |

## Database Direction

`database/schema.sql` defines the first draft of a relational schema for users, clubs, memberships, events, and event registrations. The current activities slice is still in memory, but the schema establishes the persistence shape needed for future Campus Club work.
