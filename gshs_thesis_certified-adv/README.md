# 경기과학고 졸업논문 양식 - advanced ver.

## sub files 이용
고쳐진 부분만 컴파일되기 때문에 조판 속도가 빨라집니다.

## images 폴더 사용
편리해진 이미지 관리
`\graphicspath{{images/}}`
(이미 preamble.tex 에 포함되어 있습니다.)

## bibtex 이용
thebibliography 모드 대신 이것을 사용하면 인용순 정렬, 스타일링 등이 자동으로 됩니다.

아래와 같이 사용하고, bibfile.bib 에 bibtex 코드를 쌓아놓기만 하면 됩니다.
`
\bibliographystyle{ieeetr}
\bibliography{bibfile}
`

