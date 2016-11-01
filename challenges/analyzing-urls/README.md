# Analyzing URLs

Given one URL, develop a software that indicates if the URL is valid or not and return your sections if it is valid.

Examples:

Input: http://www.google.com/mail/user=user
Output:
- Protocol: http
- Host: www
- Domain: google.com
- Path: mail
- Parameters: user=user

Input: ssh://user:password@git.com/
Output:
- Protocol: ssh
- User: user
- Password: password
- Domain: git.com

Source: http://dojopuzzles.com/problemas/exibe/analisando-urls
