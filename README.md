# gatsby-docker
Develop &amp; Build [GatsbyJS](https://www.gatsbyjs.org/) static sites within a [Docker](https://www.docker.com/) container.

### Requirements

* Mac / Linux
* Docker

### Run

```sh
$ make bash
```

### Example

```sh
$ make bash
$ gatsby new hello-world https://github.com/gatsbyjs/gatsby-starter-hello-world
$ cd hello-world
$ gatsby develop --host=0.0.0.0
```

Go to http://localhost:8000/