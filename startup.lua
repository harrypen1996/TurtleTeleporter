-- INITIALIZE APIS

if  not fs.exists('/data') then
    fs.makeDir('/data')
    fs.copy('/state.lua','/data/state')
end

os.loadAPI('/data/state')

-- LAUNCH PROGRAMS AS SEPARATE THREADS
multishell.launch({}, '/main.lua')
multishell.setTitle(1, 'main')

 