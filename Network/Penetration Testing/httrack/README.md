<h1 align="center"> HTTRACK </h1>
<h4 align = "center"> <b> Hi, foundation sixty four here. </b><br>
<i><sup> Agents, anomalies has been detected in your repo's. </sup></i></h4>

# Introduction

[WARNING: WRITER ARE NOT RESPONSIBLE FOR ANY MISUSE OR DAMAGE CAUSED BY USING TOOLS MENTIONED IN THIS REPO. IT IS ILLEGAL TO USE THIS TOOLS WITHOUT MUTUAL CONSENT, YOU'VE BEEN WARNED!]

Httrack is a website cloner that you can use to clone website either for backups or even doing penetration test by using those files that you've cloned.

# Installation

To install `httrack` you can use this command:

```
$ sudo pacman -S httrack
```

# Usage

```
$ httrack google.com
```

This command will clone `google.com`, but since there's no specified option used in here, it'll just clone google.com dashboard. But it's actually not specified because you only add site, without `https://` before it, if you do this instead:

```
$ httrack https://www.google.com/
```

This will actually clone `google.com` and all 'files' related to it.

You can use this if there's a need to clone a website with `index.php?id=1` in the end of the address, this will clone most files that are related to the address `index.php` with the added `id=1` behind theme, you can actually use this in conjuction with databases to make a lab without creating html files from zero. It'll provide you with a good amount of base to use as base website.

This can also lead to `phishing` attack, if you're not aware, by cloning this website as a new server as an example, `http://gogle.com/`.

This cloned website can be anything, so be careful when you see a similar website but with different string.
