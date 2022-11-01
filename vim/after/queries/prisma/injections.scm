; extends

((comment) @typescript
(#match? @typescript "^/// \\@")
(#offset! @typescript 0 3 0 0))
