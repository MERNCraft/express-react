# Using Express to serve a React frontend #

### Or: why use two servers when one will do? ###

[Full Tutorial]()

When creating a web site using the MERN stack (MongoDB, Express, React and NodeJS), you might use [Vite](https://vite.dev/) to develop your frontend, and then use a hosting site such as [Render.com](https://render.com/) to host your frontend and backend separately. Having the frontend run from a different origin URL than the backend means that you will have to deal with [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) issues (Cross-Origin Resource Sharing).

However, when a site built with Vite is deployed, the `build` process actually reduces your site to three static files:
* index.html
* assets/index_s0m35tuff.js
* assets/index_m0reT3xt.css
  
The `build` process creates these in a folder called `dist/` and adds to this folder any additional files that you may have included in the `public/` folder.

In other words, you can deploy your Vite React frontend as simply as you would for a site built by hand with HTML, CSS and JavaScript.

Your Express backend can [serve static files from a chosen folder](https://expressjs.com/en/starter/static-files.html). This means that you can use code as simple as...

```js
app.use(express.static('public'))
```
... to serve your Vite React frontend. All you have to do is:
* Run `npm run build` in your Vite React director
* Copy the files from the `dist/` folder into the `public/` folder in your backend directory
* Deploy your backend server.

As a result, CORS is no longer an issue.

---

[This tutorial]() will walk you through creating a simple React frontend and Express backend, and setting up a workflow that simplifies the whole deployment process.

As a bonus, it will also show you how to set up an [Nginx](https://www.f5.com/go/product/welcome-to-nginx) reverse-proxy on your development computer, so that you can preview the "production" version of your site from the comfort of your own development computer.

This repository contains all the files for the completed project.