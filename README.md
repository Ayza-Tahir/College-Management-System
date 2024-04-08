# College-Management-System

This is a description of a College Management System developed using ASP.NET and C# programming languages. The system is designed to be accessed only by administrators who have valid credentials stored in the Admin Database. Upon successful login, the administrator is directed to the Admin Home page where they can access various modules and perform operations such as adding, deleting, and searching data related to students, teachers, books,student year and fees.

In the Class Management module, the admin can add, delete, and edit class names offered in the college. Additionally, they can set fees amounts for each class. Existing class names cannot be duplicated, but their fee amounts can be edited or deleted. The page displays four rows at a time due to the specified page size. New book names for each class can also be inserted, edited, or deleted in this module.

The Teacher Management module allows for the insertion, editing, and deletion of teacher records. Only phone numbers with 11 digits are accepted for insertion; otherwise, the operation will be rejected.

The Student Record module is designed for managing student records, where operations such as editing, inserting, and deleting student data can be performed. Success messages are displayed on the screen upon completion of these operations.

After logout, the login page is displayed again for the next user to log in.
