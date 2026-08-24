#!/bin/bash
set -e
cd "$(dirname "$0")/../assets/img"

declare -A files=(
  ["profile-hero.jpg"]="https://static.wixstatic.com/media/1ae01b_1625e2f808a34a739d4338d6011dfeb9~mv2.jpg"
  ["logo-amazon.png"]="https://static.wixstatic.com/media/1ae01b_898eebc4d81f4ca5ad57c4f5744b27a8~mv2.png"
  ["logo-siemens.png"]="https://static.wixstatic.com/media/1ae01b_c7377bfb04b84d83b901b19311ed3520~mv2.png"
  ["logo-ebsb.jpeg"]="https://static.wixstatic.com/media/1ae01b_a110f828930a4c2c8b5092ca5c8b63c9~mv2.jpeg"
  ["logo-bu.png"]="https://static.wixstatic.com/media/1ae01b_87c6a56cd5c34f79ba46c59613130b03~mv2.png"
  ["about-photo-1.jpg"]="https://static.wixstatic.com/media/1ae01b_37db01a588384023b75a3e15f4df740f~mv2.jpg"
  ["about-photo-2.jpg"]="https://static.wixstatic.com/media/1ae01b_d81535408af14f84b91d420351660187~mv2.jpg"
  ["about-photo-3.jpg"]="https://static.wixstatic.com/media/1ae01b_b18eb22a31e540f68e80ce33be121672~mv2.jpg"
  ["about-photo-4.jpg"]="https://static.wixstatic.com/media/1ae01b_5226a3352b15476d85464d5ee94deabb~mv2.jpg"
  ["projects-header-icon.jpg"]="https://static.wixstatic.com/media/11062b_41e2b9b5f997476c8c2d967786d0b3ba~mv2.jpg"
  ["thumb-amazon-internship.jpg"]="https://static.wixstatic.com/media/1ae01b_b461ec3b189248a29f235b2a643748e1~mv2.jpg"
  ["thumb-warehouse-robot.jpg"]="https://static.wixstatic.com/media/1ae01b_1a60c436218b48148118ac9e3547e6b3~mv2.jpg"
  ["thumb-cart.png"]="https://static.wixstatic.com/media/1ae01b_7ae5cf3e3fd641f9a0760f47429c6af7~mv2.png"
  ["thumb-ultrasonic.jpg"]="https://static.wixstatic.com/media/1ae01b_65bbf78e37474dc59e9532263685eef4~mv2.jpg"
  ["thumb-siemens.jpeg"]="https://static.wixstatic.com/media/1ae01b_a9459153af4b4c6e840e3b35b0c4322f~mv2.jpeg"
  ["thumb-connect4.jpg"]="https://static.wixstatic.com/media/1ae01b_a46aa0b5aad94974865af212b9c9f54e~mv2.jpg"
  ["thumb-color-sorter.png"]="https://static.wixstatic.com/media/1ae01b_87545929af6c402ab5a03e283259a1c3~mv2.png"
  ["thumb-manufacturing.jpg"]="https://static.wixstatic.com/media/1ae01b_fccdb037ff29445689ec71652a9571bf~mv2.jpg"
  ["certifications-bg.jpg"]="https://static.wixstatic.com/media/11062b_126ba3275136406ca073529629425845~mv2.jpg"
  ["cert-aws-icon.png"]="https://static.wixstatic.com/media/1ae01b_38cda3dbd1974f329087b1b0f33e2218~mv2.png"
  ["cert-aws-badge.png"]="https://static.wixstatic.com/media/1ae01b_4a25e375752f4b57b3703320da12dad6~mv2.png"
  ["cert-nvidia-icon.png"]="https://static.wixstatic.com/media/1ae01b_a197b84fe66540339549b8f1febe203e~mv2.png"
  ["cert-nvidia-badge.png"]="https://static.wixstatic.com/media/1ae01b_73e86e24a44d49ba969cf81cc9f5099c~mv2.png"
  ["athletics-icon.jpg"]="https://static.wixstatic.com/media/1ae01b_ba45d7507483464291fdcc5694e30a7d~mv2.jpg"
  ["athletics-photo-1.jpg"]="https://static.wixstatic.com/media/1ae01b_7818ff91c1f249f886cb76dc108afda0~mv2.jpg"
  ["athletics-photo-2.jpg"]="https://static.wixstatic.com/media/1ae01b_a057e8f391c24287820af55d80d405c8~mv2.jpg"
  ["logo-linkedin.png"]="https://static.wixstatic.com/media/1ae01b_bb548b95e9ab45c4b0c02c5fe2f4c467~mv2.png"
)

for name in "${!files[@]}"; do
  url="${files[$name]}"
  echo "Downloading $name ..."
  curl -sSL -A "Mozilla/5.0" -o "$name" "$url"
done
echo "Done."
ls -la
