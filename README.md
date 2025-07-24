BatchUserCreator
====================================
BatchUserCreator is a convenient and secure Bash script designed for system administrators or anyone needing to create multiple Linux user accounts efficiently. The script allows you to specify a base username and the number of users to create. For each user, it either assigns a user-provided password or generates a strong random password between 8 to 16 characters, including letters, numbers, and special symbols.

You can also choose whether to create home directories for the users automatically. All generated usernames and their corresponding passwords are saved to a file named users.list for easy reference. This tool helps automate the user provisioning process while maintaining good security practices.


## 🌟 Features
<p dir="auto" style="white-space: pre-wrap;">The application relies on the following Node.js packages, as seen in the code:</p>
<ol dir="auto">
<li><strong>Generate multiple users with sequential usernames (e.g., user1, user2, user3...)</strong></li>
<li><strong>Support for using a fixed password or generating random, strong passwords per user</strong></li>
<li><strong>Passwords length vary between 8 to 16 with mixed character sets (letters, digits, special characters)</strong></li>
<li><strong>Option to create home directories for new users</strong></li>
<li><strong>Saves all user credentials in a neat output file for reference</strong></li>
<li><strong>Input validation for user counts and password settings</strong></li>
<li><strong>Interactive prompts make it easy to customize behavior on the fly</strong></li>
<li><strong>Lightweight and requires only Bash and standard Linux utilities</strong></li>
</ol>
<br><br>


## — Feedback ❤️—
Thank you for using BatchUserCreator — your input helps make it better for everyone!<br>
Please leave a comment if you have any comments, suggestions or problems.
