stylelintoutput="$(mktemp)" && \
  unbuffer deno run --node-modules-dir --allow-env --allow-read npm:stylelint/stylelint '**/*.css' | tee "$stylelintoutput" && \
  ! [ -s "$stylelintoutput" ]
