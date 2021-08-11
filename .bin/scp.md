SCP(1)                                                                    BSD General Commands Manual                                                                   SCP(1)

NAME
     scp —Openssh безопасный файл копия

SYNOPSIS
     scp [-346ABCpqrTv] [-c шифр] [-F ssh_config] [-i identity_file] [-J пункт назначения] [-l limit] [-o ssh_option] [-P port] [-S program] исходная цель

DESCRIPTION
     scp Копирует файлы между хостами в сети.

    Он использует SSH (1) для передачи данных и использует одинаковую аутентификацию и обеспечивает ту же безопасность в качестве сеанса входа в систему.Протокол SCP требует выполнения удаленного
     Shell's Shell для выполнения шаблона (3).

     scp спросит пароли или пароли, если они необходимы для аутентификации.

     Источник и цель могут быть указаны как локальный путь, удаленный хост с дополнительным путем в форме [user@]host:[path], или URI в форме
     scp://[user@]host[:port][/path].  Локальные имена файлов могут быть сделаны явными с использованием абсолютных или относительных путей, чтобы избежать имен файлов SCP, содержащие ‘:’ как хост
     Спецификаторы.

     При копировании двух удаленных хостов, если используется формат URI, порт может быть указан только на цели, если используется параметр -3.

     The options are as follows:

     -3     Копии между двумя удаленными хостами передаются через локальный хост.Без этой опции данные копируются непосредственно между двумя удаленными хостами.Обратите внимание, что
             Эта опция отключает счетчик прогресса и выбирает пакетный режим для второго хоста, поскольку SCP не может задать пароли или пароли для обоих хостов.

     -4      Заставляет SCP использовать только адреса IPv4.

     -6      Заставляет SCP использовать только IPv6 адресов.

     -A     Разрешает переадресацию SSH-Agent (1) к удаленной системе.По умолчанию не стоит пересылать агент аутентификации.

     -B     Выбирает пакетный режим (предотвращает просьбу паролей или паролей).

     -C      Включение сжатия.Проходит флагом -c в SSH (1), чтобы включить сжатие.

     -c cipher
            Выбирает шифр для использования для шифрования передачи данных.Эта опция напрямую передается ssh(1).

     -F ssh_config
             Определяет альтернативный файл конфигурации пользователя для SSH.Эта опция напрямую передаетсяssh(1).

     -i identity_file
             Выбирает файл, из которого чтение идентификация (закрытый ключ) для аутентификации открытого ключа.Эта опция напрямую передается ssh(1).

     -J destination
             Подключитесь к целевому хосту, сначала сделав соединение SCP к хосту Jump, описываемую по назначению, а затем установление пересылки TCP к Ultimate
             пункт назначения оттуда.Многократные прыжки могут быть указаны разделены символами запяты.Это ярлык для указания директивы конфигурации ProxyJump.
             Эта опция напрямую передается ssh(1).

     -l limit
             Ограничивает используемую пропускную способность, указанную в кбит / с.


     -o ssh_option
             Может использоваться для передачи опций SSH в формате, используемом в ssh_config(5).  Это полезно для указания вариантов, для которых нет отдельной командной строки SCP
             флаг.Для получения полной информации о параметрах перечислены ниже, и их возможные значения см. ssh_config(5).

                   AddressFamily
                   BatchMode
                   BindAddress
                   BindInterface
                   CanonicalDomains
                   CanonicalizeFallbackLocal
                   CanonicalizeHostname
                   CanonicalizeMaxDots
                   CanonicalizePermittedCNAMEs
                   CASignatureAlgorithms
                   CertificateFile
                   ChallengeResponseAuthentication
                   CheckHostIP
                   Ciphers
                   Compression
                   ConnectionAttempts
                   ConnectTimeout
                   ControlMaster
                   ControlPath
                   ControlPersist
                   GlobalKnownHostsFile
                   GSSAPIAuthentication
                   GSSAPIDelegateCredentials
                   HashKnownHosts
                   Host
                   HostbasedAcceptedAlgorithms
                   HostbasedAuthentication
                   HostKeyAlgorithms
                   HostKeyAlias
                   Hostname
                   IdentitiesOnly
                   IdentityAgent
                   IdentityFile
                   IPQoS
                   KbdInteractiveAuthentication
                   KbdInteractiveDevices
                   KexAlgorithms
                   KnownHostsCommand
                   LogLevel
                   MACs
                   NoHostAuthenticationForLocalhost
                   NumberOfPasswordPrompts
                   PasswordAuthentication
                   PKCS11Provider
                   Port
                   PreferredAuthentications
                   ProxyCommand
                   ProxyJump
                   PubkeyAcceptedAlgorithms
                   PubkeyAuthentication
                   RekeyLimit
                   SendEnv
                   ServerAliveInterval
                   ServerAliveCountMax
                   SetEnv
                   StrictHostKeyChecking
                   TCPKeepAlive
                   UpdateHostKeys
                   User
                   UserKnownHostsFile
                   VerifyHostKeyDNS

     -P port
             Указывает порт для подключения к удаленному хосту.Обратите внимание, что этот параметр написан с капиталом «P», потому что -P уже зарезервирован для сохранения
             раз и режимы файла.

     -p      Preserves modification times, access times, and modes from the original file.

     -q      Quiet mode: disables the progress meter as well as warning and diagnostic messages from ssh(1).

     -r      Recursively copy entire directories.  Note that scp follows symbolic links encountered in the tree traversal.

     -S program
            Название программы для использования для зашифрованного соединения.Программа должна понимать параметры SSH (1).

     -T      Disable strict filename checking.  By default when copying files from a remote host to a local directory scp checks that the received filenames match those re‐
             quested on the command-line to prevent the remote end from sending unexpected or unwanted files.  Because of differences in how various operating systems and
             shells interpret filename wildcards, these checks may cause wanted files to be rejected.  This option disables these checks at the expense of fully trusting that
             the server will not send unexpected filenames.

-V Verbose Mode.Вызывает SCP и SSH (1) для печати отладки сообщений о их прогрессе.Это полезно в отладке соединения, аутентификации и конфигурации
             проблемы с проблемами.

EXIT STATUS
     The scp utility exits 0 on success, and >0 if an error occurs.

SEE ALSO
     sftp(1), ssh(1), ssh-add(1), ssh-agent(1), ssh-keygen(1), ssh_config(5), sshd(8)

HISTORY
     scp is based on the rcp program in BSD source code from the Regents of the University of California.

AUTHORS
     Timo Rinne <tri@iki.fi>
     Tatu Ylonen <ylo@cs.hut.fi>

BSD                                                                            January 26, 2021                                                                            BSD
 Manual page scp(1) line 104/155 (END) (press h for help or q to quit)