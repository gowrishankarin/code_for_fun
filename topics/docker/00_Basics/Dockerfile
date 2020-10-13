# Set base image (host OS)
FROM python:3.7

# Set the working directory in the container
WORKDIR /code

# Copy the dependencies file to the working directory
COPY environment.yml .

RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
RUN sha256sum Anaconda3-2020.02-Linux-x86_64.sh
RUN bash Anaconda3-2020.02-Linux-x86_64.sh -b -p $HOME/anaconda3

#ENV PATH "$HOME/anaconda3/bin:$PATH"
ENV PATH="/root/anaconda3/bin:$PATH"
RUN echo $PATH
# RUN export PATH=$HOME/anaconda3/bin:$PATH
RUN ls /root -ltra
RUN conda env create -f environment.yml

# Command to run on container start
CMD ["conda activate od"]