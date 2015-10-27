# git-sync

git-sync is a small utility/side-car container that pulls a remote git repository to disk.

The code for git-sync was copied from [kubernetes/contrib](https://github.com/kubernetes/contrib/tree/master/git-sync).

The build process was re-written to shrink the size of the docker image.

Images are maintained on [quay.io/jhansen/git-sync](https://quay.io/jhansen/git-sync).

## Usage

```

    # build the container
    make docker-build

    # run the git-sync container
    docker run -e GIT_SYNC_REPO=https://github.com/slack/basic-site \
            -e GIT_SYNC_DEST=/git -e GIT_SYNC_BRANCH=master \
            -e GIT_SYNC_WAIT=600 \
            -v /git-data:/git git-sync
```

## Configuration

`git-sync` is setup for configuration via the following environment variables:

* `GIT_SYNC_REPO`: Repository URL to sync
* `GIT_SYNC_BRANCH`: Branch to sync [Default: master]
* `GIT_SYNC_REV`: Git revision to sync [Default: HEAD]
* `GIT_SYNC_DEST`: Destination path for sync
* `GIT_SYNC_WAIT`: Time in seconds to wait before syncing again

## License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Notice: This project contains code from the Kubernetes project. All code included is Copyright 2014, 2015 The Kubernetes Authors, and is made available under the Apache 2.0 license.
