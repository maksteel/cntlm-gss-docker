# cntlm-gss-docker
- cntlm with kerberos patch in a docker container

- [cntlm v0.92.3 source code](https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%200.92.3/) and [kerberos patch](https://sourceforge.net/p/cntlm/feature-requests/_discuss/thread/4a3be422/22d0/attachment/201211-cntlm-kerberos-authentication.patch) were both obtained from [sourceforge](https://sourceforge.net/projects/cntlm).

- some modification was made to `Makefile` to allow patch to be applied [see commit](ae4cb8d61607bcd308d9932d14c1d20ad55abc01)

- patch was applied using below command after the Makefile was modified.
    ```
    git apply -p0 --ignore-whitespace --directory=cntlm-0.92.3 201211-cntlm-kerberos-authentication.patch 
    ```

## Build the container
```
docker build -t cntlm-gss-docker:0.92.3 .
```