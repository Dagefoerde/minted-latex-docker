# minted-latex-docker
This is a fork from: https://github.com/vvhof/minted-latex-docker
Gitlab cannot use containers with an entrypoint. 
So here is the image without one.

## Usage
Your gitlab-ci.yml could look like this:

```yml
compile-pdf:
  stage: build
  image: dagefoerde/minted-latex-docker
  script:     
  - latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" 
  artifacts:
    name: "${CI_JOB_NAME}_${CI_COMMIT_REF_NAME}"
    paths:
    - "*.pdf"
```
