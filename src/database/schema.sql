CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT,
    display_name TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('student', 'club_admin', 'system_admin'))
);

CREATE TABLE clubs (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    category TEXT,
    contact_email TEXT,
    created_by_user_id INTEGER,
    FOREIGN KEY (created_by_user_id) REFERENCES users (id)
);

CREATE TABLE memberships (
    id INTEGER PRIMARY KEY,
    club_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending', 'approved', 'rejected', 'left')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (club_id) REFERENCES clubs (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    UNIQUE (club_id, user_id)
);

CREATE TABLE events (
    id INTEGER PRIMARY KEY,
    club_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT,
    capacity INTEGER,
    location TEXT,
    FOREIGN KEY (club_id) REFERENCES clubs (id)
);

CREATE TABLE event_registrations (
    id INTEGER PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('registered', 'cancelled', 'attended', 'absent')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES events (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    UNIQUE (event_id, user_id)
);