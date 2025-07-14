FROM emilienmottet/nasm AS builder

WORKDIR /opt

COPY hello.nasm .

RUN nasm -felf32 http.asm -o http-okay.o
RUN ld --strip-all --omagic -melf_i386 http-okay.o -o http-okay

FROM scratch

COPY --from=builder /opt/http-okay /usr/bin/http-okay

ENTRYPOINT ["/usr/bin/http-okay"]