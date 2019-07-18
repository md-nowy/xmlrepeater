# xmlrepeater
XML document generator which repeats part of the content enclosed by specified `tag` or part of it (make sure that `tag` or it's part is unique). 

## Installation
You need to have docker installed on your machine. Open terminal and simply pull the image form docker store:

```bash
docker pull mnowaczyk/xmlrepeater:latest
```

## Generating documents
In order to run script you need to bind mount host OS and container and specify as environment variables:
1. path and name of the `file` that you want to modify (you can put the file in local directory that you want mount) 
1. `tag` or part of it which encloses the part that you want to repeat (multiply)
1. number of iteration times - `i`

As an outcome `document.xml` file would be written under container's `\root` location and by will be accessible in host location provided in bind mount.

```bash
docker container run -v hostDir:/root -e file="fileToBeModified" -e tag="tagEnclosingListItem" -e i="anyNumber" mnowaczyk/xmlrepeater:latest
```

Have fun! :smiley: