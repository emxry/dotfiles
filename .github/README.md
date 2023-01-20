<div align="center">

# Emxry's Dotfiles

## :snowflake: <samp>Information</samp>

</div>
<div>
<table align=left><tr><td>
<b>- Operating System: </b><br />
<b>- Window Manager: </b><br />
<b>- Compositor: </b><br />
<b>- Terminal: </b><br />
<b>- Shell: </b><br />
<b>- Editor: </b><br />
</table>

<table><tr><td>
<a href="https://nixos.org">NixOS</a><br />
<a href="https://awesomewm.org">AwesomeWM</a><br />
<a href="https://github.com/pijulius/picom">Picom (Pijulius)</a><br />
<a href="https://wezfurlong.org">WezTerm</a><br />
<a href="https://www.fishshell.com">Fish</a><br />
<a href="https://neovim.io">Neovim</a><br />
</table>
</div>
<br>
<br>

## :wrench: <samp>Installation</samp>

1. Boot into the installer.

2. Switch to root user: `sudo -i`

3. Partitioning
    Setup Partitions
    ```bash
    512MiB - EFI Partition
    8GB - Swap Partition
    50GB - Home Partition
    Rest of Space - Root Partition
    ```

    Format partitions
    ```bash
    $ mkfs.fat -F 32 -L boot /dev/nvme0n1p1
    $ mkswap -L swap /dev/nvme0n1p2
    $ mkfs.btrfs /dev/nvme0n1p3
    $ mkfs.btrfs /dev/nvme0n1p4
    ```

    Mount partitions
    ```bash
    $ mkdir -p /mnt/boot
    $ mkdir -p /mnt/home
    $ mount /dev/nvme0n1p4 /mnt
    $ swapon /dev/nvme0n1p2
    $ mount /dev/nvme0n1p3 /mnt/home
    $ mount /dev/nvme0n1p1 /mnt/boot
    ```

4. Enable flakes
    ```bash
    $ nix-shell -p git nixUnstable nixFlakes
    ```

5. Install nixos from flake
    ```bash
    $ nixos-install --flake github:emxry/dotfiles#io
    ```

<br>
<br>

## :busts_in_silhouette: <samp>People</samp>

<table align="right">
  <tr>
    <th align="center">
      <sup><sub>:warning:</sub></sup>
    </th>
  </tr>
  <tr>
    <td align="center">
        <sup><sub><samp>If you stole something from here at least give us credits!</samp></sub></sup>
      </a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution">
        <sup><sub><samp>Powered by NixOS/Linux x86_64</samp></sub></sup>
      </a>
    </td>
  </tr>
</table>
Me
