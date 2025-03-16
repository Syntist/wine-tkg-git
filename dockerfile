FROM cachyos/cachyos:latest

USER root

# Set up pacman repositories
# RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf

# Install dependencies
RUN pacman -Syu --noconfirm base-devel sudo lib32-jack2 git curl bash ccache ntsync-header && \
    pacman -Scc --noconfirm

# Adjust permissions for the workspace and temp directory
# RUN chown user:user -R / && \
#     chown user:user -R /tmp

# Set the default working directory
USER root

WORKDIR /proton-tkg

# Default command (optional)
CMD ["bash"]