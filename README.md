# cntlm-gss-docker
- cntlm with kerberos patch in a docker container

- [cntlm v0.92.3 source code](https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%200.92.3/) and [kerberos patch](https://sourceforge.net/p/cntlm/feature-requests/_discuss/thread/4a3be422/22d0/attachment/201211-cntlm-kerberos-authentication.patch) were both obtained from [sourceforge](https://sourceforge.net/projects/cntlm).

- some modification was made to `Makefile` to allow patch to be applied [see commit ae4cb8d6](https://github.com/maksteel/cntlm-gss-docker/commit/ab986db365f0c5809891c64dd035244ced6372a2)

- patch was applied using below command after the Makefile was modified.
    ```
    git apply -p0 --ignore-whitespace --directory=cntlm-0.92.3 201211-cntlm-kerberos-authentication.patch 
    ```

## Build the container
```
docker build -t cntlm-gss-docker:0.92.3 .
```