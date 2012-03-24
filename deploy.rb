puts "Deploying to Dotcloud..."
`dotcloud push rdlabdd`
puts "Upload database config file"
`dotcloud run rdlabdd.www "cat > current/config/database.yml"< config/database.yml`
puts "Running Assets compilation"
`dotcloud run rdlabdd.www "cd current && rake assets:precompile"`
puts "RDLA Deployed!"
