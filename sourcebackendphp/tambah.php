<?php

$connection = new mysqli("localhost", "root", "", "appsurat");
$instansi       = $_POST['instansi']; 
$perihal        = $_POST['perihal'];
$tglsrt         = $_POST['tglsrt'];
$tglsrtdtrm      = $_POST['tglsrtdtrm']; 
$noagenda        = $_POST['noagenda'];
$klasifikasi     = $_POST['klasifikasi'];
$status       = $_POST['status']; 
$sifat        = $_POST['sifat'];
$fotosurat     = $_POST['fotosurat'];
$lampiran     = $_POST['lampiran'];
$nosurat     = $_POST['nosurat'];

$result = mysqli_query($connection, "insert into srtmasuk set 
instansi='$instansi', perihal='$perihal', tglsrt='$tglsrt', 
tglsrtdtrm='$tglsrtdtrm', noagenda='$noagenda', klasifikasi='$klasifikasi', 
status='$status', sifat='$sifat', fotosurat='$fotosurat'
lampiran='$lampiran', nosurat='$nosurat'");

if($result){
    echo json_encode([
        'message' => 'Data input successfully'
    ]);
}else{
    echo json_encode([
        'message' => 'Data Failed to input'
    ]);
}
?>