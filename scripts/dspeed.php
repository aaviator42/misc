<?php
// 2023-07-09
// measure how long it takes to download a file
// php dspeed.php <url>

function calculateConnectionSpeed($fileSize, $downloadTime)
{
    $speedInBits = ($fileSize * 8) / $downloadTime;
    $speedInMbps = $speedInBits / 1000000;

    return $speedInMbps;
}

function downloadFile($url)
{
    $startTime = microtime(true);

    $fileContents = file_get_contents($url);

    $fileSize = strlen($fileContents);
    $endTime = microtime(true);
    $downloadTime = $endTime - $startTime;

    return [$fileSize, $downloadTime];
}


// Check if the file URL is provided as an argument
if ($argc < 2) {
    echo "Please provide a file URL as an argument.\n";
    exit(1);
}

$fileUrl = $argv[1];

list($fileSize, $downloadTime) = downloadFile($fileUrl);
$speedInMbps = calculateConnectionSpeed($fileSize, $downloadTime);

echo "File downloaded successfully.\n";
echo "File Size: " . number_format($fileSize / 1048576, 2) . " MB\n";
echo "Download Time: " . number_format($downloadTime, 2) . " seconds\n";
echo "Connection Speed: " . number_format($speedInMbps, 2) . " Mbps\n";
