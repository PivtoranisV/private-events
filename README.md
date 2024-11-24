# Private Events

Private Events is a **Ruby on Rails** application where users can create events, attend events, and view events filtered by categories like Art, Music, Education, and other. The app demonstrates the use of Rails associations, authentication, and authorization using **Devise**, as well as front-end design with **Bootstrap**.

## Features

- User authentication and registration using Devise.
- Users can create, edit, and delete events.
- Events include details like title, description, date, location, and category.
- Users can attend events.
- Event attendees are listed on the event detail page.
- View all events or filter events by category (e.g., Art, Music).
- Separate views for created events and attended events.
- Responsive UI with Bootstrap.

## Technologies Used

- Backend: Ruby on Rails
- Frontend: HTML, CSS, Bootstrap
- Database: PostgreSQL
- Authentication: Devise gem
- Testing: RSpec, Shoulda Matchers, Capybara
- Version Control: Git

## Getting Started

### Prerequisites

- Ruby (version 3.2.2 or higher)
- Rails (version 7.0 or higher)
- PostgreSQL
- Bundler

### Installation

1. Clone the repository:

```bash
git clone https://github.com/PivtoranisV/private-events.git
cd private-events
```

2. Install dependencies:

```bash
bundle install
```

3. Set up the database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the Rails server:

```bash
bin/dev
```

5. Open the application in your browser at <http://localhost:3000>.

## Usage

### Navigation

- Home Page: Access links to view all events, your created events, attended events, or filter events by category.
- Create a new event from the “Create New Event” link in the navigation bar.
- Edit or delete your events from the event detail page.
- Attend an event using the “Attend Event” button on event cards or the event detail page.
- View a list of attendees on each event detail page.

## Acknowledgments

- Thanks to the creators of Ruby on Rails and the Devise gem for powering the application.
- Bootstrap for the responsive UI framework.
