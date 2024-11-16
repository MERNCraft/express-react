# CONFIG FOR NGINX #

1. Add an entry for `127.0.0.1 example.local` to `/etc/hosts`
   or its equivalent
2. Add a soft link from `/etc/nginx/sites-enabled/` (or its equivalent) to the `example.local` file
3. Ensure that the absolute paths in `ssl.conf` correspond to the absolute paths of the files in the `certs/` folder
4. Ensure that the port used in the line `proxy_pass http://localhost:1333;` in `exapmle.local` corresponds to the port where the backend will run
5. Ensure that the absolute path to `ssl.conf` in `example.local` corresponds te the absolute path to the `ssl.conf` file
6. Run `nginx -t` (perhaps with `sudo`)
7. Run `systemctl restart nginx` or its equivalent
8. Visit `https//example.local` in your browser

`example.com` is a template that you can use on a production server. You will need to generate certificates for it with Certbot for a domain name that you own.