param(
  [Parameter(Mandatory=$true)][string]$Dir,
  [int]$MaxDim = 1600,
  [int]$Quality = 82
)

Add-Type -AssemblyName System.Drawing

function Resize-One($path, $maxDim, $quality) {
  $ext = [System.IO.Path]::GetExtension($path).ToLower()
  $img = [System.Drawing.Image]::FromFile($path)
  $w = $img.Width
  $h = $img.Height
  $scale = [Math]::Min(1.0, $maxDim / [Math]::Max($w, $h))
  if ($scale -ge 1.0) {
    Write-Host "skip (already small): $path ($w x $h)"
    $img.Dispose()
    return
  }
  $nw = [int]([Math]::Round($w * $scale))
  $nh = [int]([Math]::Round($h * $scale))
  $bmp = New-Object System.Drawing.Bitmap $nw, $nh
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $g.DrawImage($img, 0, 0, $nw, $nh)
  $g.Dispose()
  $img.Dispose()

  $tmp = $path + ".tmp"
  if ($ext -eq ".png") {
    $bmp.Save($tmp, [System.Drawing.Imaging.ImageFormat]::Png)
  } else {
    $jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
    $encParams = New-Object System.Drawing.Imaging.EncoderParameters 1
    $encParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [int64]$quality)
    $bmp.Save($tmp, $jpegCodec, $encParams)
  }
  $bmp.Dispose()
  Move-Item -Force $tmp $path
  Write-Host "resized: $path ($w x $h) -> ($nw x $nh)"
}

Get-ChildItem -Path $Dir -File | Where-Object { $_.Extension -match '\.(jpg|jpeg|png)$' } | ForEach-Object {
  Resize-One $_.FullName $MaxDim $Quality
}
