lua << EOF
require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "~/groovy-language-server/build/lib/groovy-language-server-all.jar"}
}
EOF

