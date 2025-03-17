FROM ticpu/archlinux-paru

USER root

# Set up pacman repositories
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf

# Install dependencies
RUN pacman -Syu --noconfirm base-devel sudo lib32-jack2 git curl bash ccache && \
    pacman -Scc --noconfirm

RUN useradd -m auruser && \
    echo "auruser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the non-root user
USER auruser

RUN paru -S ntsync-header

# Set the default working directory
USER root

WORKDIR /proton-tkg

# Default command (optional)
CMD ["bash"]