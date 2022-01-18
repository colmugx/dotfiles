echo "Now Init Node Environment..."
echo "====================================="

npm config set registry https://repo.huaweicloud.com/repository/npm/
npm cache clean -f

list=(
    yarn
    nrm
    yrm
    pnpm
)

for item in "${list[@]}"; do
  if npm list -g --depth=0 "$item" >/dev/null 2>&1; then
    echo "$item already installed... skipping."
  else
    npm install $item -g
  fi
done

yrm add huawei https://repo.huaweicloud.com/repository/npm/
nrm add huawei https://repo.huaweicloud.com/repository/npm/

yrm use huawei

# list=(
#     neovim
#     typescript
# )

# for item in "${list[@]}"; do
#   if npm list -g --depth=0 "$item" >/dev/null 2>&1; then
#     echo "$item already installed... skipping."
#   else
#     npm install $item -g
#   fi
# done
