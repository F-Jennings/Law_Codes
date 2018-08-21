#Select input directory path
$documents_path = Read-Host -Prompt 'Input Directory Path'
Write-Host "You picked '$documents_path'"

#Select output directory path
$output_path = Read-Host -Prompt 'Input Output Diretory Path'
Write-Host "Output will go to '$output_path'"

$word_app = New-Object -ComObject Word.Application

# This filter will find .doc as well as .docx documents
Get-ChildItem -Recurse $documents_path -Filter *.doc? | ForEach-Object {

    $document = $word_app.Documents.Open($_.FullName)

    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"

    $document.SaveAs($output_path, [ref] $pdf_filename, [ref] 17)

    $document.Close()
}

$word_app.Quit()