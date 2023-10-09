User Management Script

This script is designed to create a user with limited SSH access, set an expiration date, and optionally limit the user's network traffic.

# Features

- Creates a user with limited SSH access.
- Sets an expiration date for the user.
- Optionally limits the user's network traffic.


Usage


1. Clone the repository:

   ```bash
   git clone https://github.com/momalekiii/sshmaker.git
      ```

2. Navigate to the script directory:

   ```bash
   cd sshmaker
   ```

3. Run the script with the necessary arguments:

   ```bash
   sudo bash create_user.sh <username> <expire_date> <download_limit_kbps> <upload_limit_kbps>
   ```

   Replace the placeholders with the actual values.

   - `<username>`: Desired username for the new user.
   - `<expire_date>`: Expiration date for the user in YYYY-MM-DD format.
   - `<download_limit_kbps>`: Download limit for the user in kilobits per second (kbps).
   - `<upload_limit_kbps>`: Upload limit for the user in kilobits per second (kbps).

## Example

```bash
sudo bash create_user.sh john.doe 2023-12-31 1024 512
```

This will create a user named "john.doe" with an expiration date of December 31, 2023, and set the download limit to 1024 kbps and upload limit to 512 kbps.

## License

This script is licensed under the [MIT License](LICENSE).
```

Feel free to use this content for your GitHub README. If you have any further requests or modifications needed, please let me know!
