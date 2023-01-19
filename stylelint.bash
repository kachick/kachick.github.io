# stdbuf does not correctly handle the original color... :<
# unbuffer does not end in GitHub Actions... :<
stylelintoutput="$(mktemp)" && \
  deno run --node-modules-dir --allow-env --allow-read npm:stylelint/stylelint '**/*.css' | tee "$stylelintoutput" && \
  ! [ -s "$stylelintoutput" ]
