## How to get running jupyter notebook with all required dependencies for CSCC11
 - First, you should install `podman`. I have homebrew, thus it is a matter of running `brew install podman`
 - Second, we want to initialize and start podman VM.
   - Run `podman machine init`
   - Run `podman machine start`
 - Third, in this repository you will find a dockerfile. This file will be used to build an image for our container. if you have no idea what I just said read about [containerization](https://www.citrix.com/solutions/app-delivery-and-security/what-is-containerization.html) and [podman](https://docs.podman.io/en/latest/)
     - Just download `Dockerfile` from the repository using git or just manual copy and paste
     - Place downloaded file in a seperate folder for convenience
     - Open your terminal and navigate to the folder you downloaded the `Dockerfile`
     - Run `podman build . -t jupyter`. `-t` stands for tag, We will be adressing our image as jupyter. It will take some time, ~30 min. It takes so long because it will be building matplotlib and scipy from source. Do now worry, you fanless m1 macs will not burn.
     - Finally, once building is finished run `podman run -p 8888:8888 localhost/jupyter`. After few seconds you will see something like this:
     ```
     [I 04:45:31.693 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
    [I 04:45:31.794 NotebookApp] Serving notebooks from local directory: /
    [I 04:45:31.794 NotebookApp] Jupyter Notebook 6.4.7 is running at:
    [I 04:45:31.795 NotebookApp] http://b8b3d8e30f3a:8888/?token=.....
    [I 04:45:31.795 NotebookApp]  or http://127.0.0.1:8888/?token=......
    [I 04:45:31.795 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [C 04:45:31.797 NotebookApp] 

        To access the notebook, open this file in a browser:
            file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://b8b3d8e30f3a:8888/?token=.......
     or http://127.0.0.1:8888/?token=.......
     ``` 
Just copy one of the links(http://b8b3d8e30f3a:8888/?token=.......) somewhere, so you do not lose it.

Now if you go to the link, you will see that you have jupyter notebook running without any issue.

## Small guide into podman

 - To list running containers just run `podman ps`
 - To stop running container just run `podman stop container_name`
 The name of container listed under running containers
 - To start stopped container run `podman start container_name`
 
 **It is important to note**: All the files you created before stopping container will be saved in that container. Once you start that container you can easily continue working on your project 
 - To remove container simply run `podman rm container_name`
 - To stop podman internal machine run `podman machine stop`. Otherwise it will be running even when you stop all containers

 ## Contributing
  Make a `PR`  if you want to add more transparency to the guide or fix my grammar or add comments to `Dockerfile` 

## PS
All the dependencies I install in container are **really** neccessary. Most of them are used either to install python3.7 or scipy or matplotlib. I spent the whole day figuring this stuff out.
 
