#!/bin/bash
set -e
BASE="$(dirname "$0")/../assets/img/projects"

dl() {
  local dir="$1"; local name="$2"; local url="$3"
  echo "Downloading $dir/$name ..."
  curl -sSL -A "Mozilla/5.0" -o "$BASE/$dir/$name" "$url"
}

# Warehouse Robot
dl warehouse-robot hero.jpg "https://static.wixstatic.com/media/1ae01b_b3c13489559c41cabdb106a234a44e95~mv2.jpg"
dl warehouse-robot design-diagram-1.png "https://static.wixstatic.com/media/1ae01b_e4ee0c6c98854af18f868b59f313300a~mv2.png"
dl warehouse-robot design-diagram-2.png "https://static.wixstatic.com/media/1ae01b_b73bfdb08d75422b993d0041c474b983~mv2.png"
dl warehouse-robot objective-diagram.png "https://static.wixstatic.com/media/1ae01b_dd809007ace3469a8da33259d89e84d9~mv2.png"
dl warehouse-robot servo-diagram.png "https://static.wixstatic.com/media/1ae01b_b5d56a4daa2a4f078a8b8221832c2594~mv2.png"
dl warehouse-robot hardware-photo.png "https://static.wixstatic.com/media/1ae01b_3d7c2a12a9d64bfd95508062ad3f82ce~mv2.png"
dl warehouse-robot sensing-diagram.png "https://static.wixstatic.com/media/1ae01b_994fff7de83e4d71890157a8e8e59189~mv2.png"
dl warehouse-robot build-photo.jpg "https://static.wixstatic.com/media/1ae01b_4ba8d0060fb44d2281fc755276556e3d~mv2.jpg"
dl warehouse-robot fsr-diagram.png "https://static.wixstatic.com/media/1ae01b_1c6e37db86fe4b95ae994299aba40705~mv2.png"
dl warehouse-robot kinematics-diagram.png "https://static.wixstatic.com/media/1ae01b_2d462426c2bb4f6c848ef35e71f2b350~mv2.png"
dl warehouse-robot team-photo.jpg "https://static.wixstatic.com/media/1ae01b_27caeade65694a87831a3a5c10e26bf7~mv2.jpg"

# Cart - Beam Balancing
dl cart hero.png "https://static.wixstatic.com/media/1ae01b_7ae5cf3e3fd641f9a0760f47429c6af7~mv2.png"
dl cart plot-acceleration.jpg "https://static.wixstatic.com/media/1ae01b_52b13a3e32fb443abb2a26afdebaa2a7~mv2.jpg"
dl cart plot-force.jpg "https://static.wixstatic.com/media/1ae01b_01a6872fe5d7462ea8297ac92bd878b8~mv2.jpg"
dl cart cart-top.jpg "https://static.wixstatic.com/media/1ae01b_b37994bfea27479eaa2680e9a201f221~mv2.jpg"
dl cart cart-bottom.jpg "https://static.wixstatic.com/media/1ae01b_3b66c2e0773c4f578905ee9d67d7232d~mv2.jpg"

# Siemens Digital Twin
dl siemens hero.jpg "https://static.wixstatic.com/media/1ae01b_1f5565dac4c8448cbe6e9699e8e235f4~mv2.jpg"
dl siemens kinematics.jpg "https://static.wixstatic.com/media/1ae01b_e3ad27a2788c4375b91cdd98faeb41e1~mv2.jpg"
dl siemens plc-screenshot.png "https://static.wixstatic.com/media/1ae01b_97f7df2f8a0a4b699bef66e18330802d~mv2.png"
dl siemens connected-signals.png "https://static.wixstatic.com/media/1ae01b_7f41b0ff80544ba5b17491f6b6be55f8~mv2.png"
dl siemens cell-photo.jpeg "https://static.wixstatic.com/media/1ae01b_70aed329123648eb8158ec73861afd89~mv2.jpeg"

# Connect-4
dl connect4 hero.jpg "https://static.wixstatic.com/media/1ae01b_8443439e15d04000962472883d45d3e2~mv2.jpg"
dl connect4 cad-isometric.jpg "https://static.wixstatic.com/media/1ae01b_a5d8b4f05c4c4d94a45fb49cf742d066~mv2.jpg"
dl connect4 end-effector.jpg "https://static.wixstatic.com/media/1ae01b_f638ff5099bb40edace308f0c010107b~mv2.jpg"
dl connect4 circuitry.jpg "https://static.wixstatic.com/media/1ae01b_9532601159a1436cbb3708697d9fd6f5~mv2.jpg"
dl connect4 code-screenshot.png "https://static.wixstatic.com/media/1ae01b_d27a9404eab546548cffc2498db04dc2~mv2.png"
dl connect4 group-photo.jpg "https://static.wixstatic.com/media/1ae01b_4f861787abf6435d8f4011367a8a46fc~mv2.jpg"

# Color Sorter
dl color-sorter hero.png "https://static.wixstatic.com/media/1ae01b_15158824dbb14e58a517e14ed1767612~mv2.png"
dl color-sorter device-photo-1.jpeg "https://static.wixstatic.com/media/1ae01b_97a482e178524220ba0a6e5053a013b1~mv2.jpeg"
dl color-sorter device-photo-2.jpeg "https://static.wixstatic.com/media/1ae01b_8a6dceada1e643c09d7bfd6b02c00ff8~mv2.jpeg"
dl color-sorter code-screenshot.png "https://static.wixstatic.com/media/1ae01b_14e836d58351463a828f10c14f0defb9~mv2.png"

# Manufacturing
dl manufacturing hero.jpg "https://static.wixstatic.com/media/1ae01b_fccdb037ff29445689ec71652a9571bf~mv2.jpg"
dl manufacturing cnc-cad.jpg "https://static.wixstatic.com/media/1ae01b_e728684166b643738defaff4bdd24f83~mv2.jpg"
dl manufacturing haas-cnc.jpg "https://static.wixstatic.com/media/1ae01b_0ff582ddb136481ab6d8f2d5e51aca5c~mv2.jpg"
dl manufacturing manual-mill.jpg "https://static.wixstatic.com/media/1ae01b_24568a72f02d4677897be9a73db06d6b~mv2.jpg"
dl manufacturing piece-overview.jpg "https://static.wixstatic.com/media/1ae01b_34fb94fc732340d5877eae279cf4498d~mv2.jpg"
dl manufacturing red-plate.jpg "https://static.wixstatic.com/media/1ae01b_6537a2742f454108b2a5c96e1915982f~mv2.jpg"
dl manufacturing cnc-lathe.jpg "https://static.wixstatic.com/media/1ae01b_b2d07f07694f42b7aaa52b66a23e0268~mv2.jpg"
dl manufacturing golden-brass.jpg "https://static.wixstatic.com/media/1ae01b_4e58f52a39244f1ea4fa20dd5d5f0c30~mv2.jpg"

echo "Done."
find "$BASE" -type f | wc -l
