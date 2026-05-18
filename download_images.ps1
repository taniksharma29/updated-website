# Download images from royalhavelisj and save into assets/images
$dest = Join-Path -Path $PSScriptRoot -ChildPath 'assets\images'
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest | Out-Null }

$images = @{
    'logo.png' = 'https://static.wixstatic.com/media/03a7f7_a240c6fee5c4468d854221ccd44c5069~mv2.png'
    'hero.jpg' = 'https://static.wixstatic.com/media/03a7f7_f7a76cda2e664ff4872909b9721e49b2~mv2.jpg/v1/fill/w_980,h_860,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/ai-generated-IMAGE.jpg'
    'royal-chicken-biryani.jpg' = 'https://static.wixstatic.com/media/03a7f7_38e96c5bb1cf42038b99d2fbfc73bb49~mv2.jpg/v1/fill/w_524,h_698,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/Royal%20Chicken%20Biryani.jpg'
    'tandoori-grilled-chicken.jpg' = 'https://static.wixstatic.com/media/03a7f7_577ccf33cc4942e88c5c86c5c3c67822~mv2.jpg/v1/fill/w_147,h_196,al_c,q_80,usm_0.66_1.00_0.01,blur_2,enc_avif,quality_auto/Tandoori%20Grilled%20Chicken.jpg'
    'butter-chicken.jpg' = 'https://static.wixstatic.com/media/03a7f7_1d1de469d4c443419fb9195f8e8b44bc~mv2.jpg/v1/fill/w_147,h_196,al_c,q_80,usm_0.66_1.00_0.01,blur_2,enc_avif,quality_auto/Creamy%20Butter%20Chicken.jpg'
    'garlic-naan.jpg' = 'https://static.wixstatic.com/media/03a7f7_91cdb92965914e4ba079024da20266ff~mv2.jpg/v1/fill/w_147,h_196,al_c,q_80,usm_0.66_1.00_0.01,blur_2,enc_avif,quality_auto/Garlic%20Naan.jpg'
    'slow-cooked-lamb.jpg' = 'https://static.wixstatic.com/media/03a7f7_509f88a6b5aa419b8d5b193f1df434e1~mv2.jpg/v1/fill/w_147,h_196,al_c,q_80,usm_0.66_1.00_0.01,blur_2,enc_avif,quality_auto/Slow-Cooked%20Lamb%20Curry.jpg'
    'paneer-tikka.jpg' = 'https://static.wixstatic.com/media/03a7f7_35f6d83b677c4c0b8c221fe807f1c44d~mv2.jpg/v1/fill/w_147,h_196,al_c,q_80,usm_0.66_1.00_0.01,blur_2,enc_avif,quality_auto/Paneer%20Tikka.jpg'
}

foreach ($name in $images.Keys) {
    $url = $images[$name]
    $out = Join-Path $dest $name
    try {
        Write-Host "Downloading $url -> $out"
        Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing -ErrorAction Stop
    }
    catch {
        Write-Warning "Failed to download $url : $_"
    }
}

Write-Host "Done. Images saved to $dest"
