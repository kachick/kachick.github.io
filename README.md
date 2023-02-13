# kachick.github.io

https://kachick.github.io/

## How to development

```console
> nix-shell
> deno run --allow-net --allow-read https://deno.land/std@0.159.0/http/file_server.ts public
Listening on http://localhost:4507/
```

Then you can access to http://localhost:4507/

Run stylelint

```console
deno cache --node-modules-dir npm:stylelint@15.1.0 npm:stylelint-config-standard@30.0.1 --reload
./stylelint.bash
```

If you want color prints of stylelint, see [comments of the task](stylelint.bash) for further detail.
