# School Management System

This School Management System is a straightforward Ruby application that simplifies student record management for educational institutions. This program allows users to perform CRUD (Create, Read, Update, Delete) operations on student records, facilitating efficient and organized school administration.

## Features

- **Add Student:** Easily input a new student's name, class, roll number, address, and contact details. The system validates the data and stores it in a PostgreSQL database for secure and persistent records.
- **Display Students:** View a comprehensive list of all enrolled students and their respective information. This feature provides quick access to student details for administrative purposes.
- **Edit Student:** Authorized users can modify a student's address and contact information. The changes are instantly updated in the database, ensuring real-time data integrity.
- **Delete Student:** Remove a student's record from the database based on their unique ID. This feature promotes data accuracy and keeps the system up-to-date.

## Getting Started

1. Ensure you have Ruby and PostgreSQL installed on your system.
2. Clone this repository to your local machine.
3. Run `bundle install` to install required dependencies.
4. Create a PostgreSQL database with the name "school_mgmt."
5. Run the program using `ruby crud.rb` in your terminal.

## Requirements

- Ruby (>= 2.5)
- PostgreSQL (>= 9.6)

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

We thank all contributors and the Ruby and PostgreSQL communities for their invaluable support and resources. Together, we aim to make school administration efficient and hassle-free! 🎓✨
