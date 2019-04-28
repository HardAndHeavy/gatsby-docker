# gatsby-docker
Develop &amp; Build [GatsbyJS](https://www.gatsbyjs.org/) static sites within a [Docker](https://www.docker.com/) container.

### Requirements

* Mac / Linux
* Docker
* Docker Compose

### Run

```sh
$ make bash
```

### Example

```sh
$ make bash
$ gatsby new hello-world https://github.com/gatsbyjs/gatsby-starter-hello-world
$ cd hello-world
$ gatsby develop --port=0.0.0.0
```

Go to http://localhost:8000/