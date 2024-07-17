{ writeShellScriptBin, ripgrep, xorg, ... }:

let
  xkbmap = "${xorg.setxkbmap}/bin/setxkbmap";
  rg = "${ripgrep}/bin/rg";
in
writeShellScriptBin "kls" ''
  layout=$(${xkbmap} -query | ${rg} layout)

  if [[ $layout == *"za"* ]]; then
    ${xkbmap} -layout us
  elif [[ $layout == *"us"* ]]; then
    ${xkbmap} -layout uk
  else
    ${xkbmap} -layout za
  fi
''
