# Path to your oh-my-zsh configuration.
export USER=<user-name>
ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
#Default JDK
export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"

#MongoDB Path
export MONGO_HOME=/Users/$USER/mongodb
#maven
export M2_HOME=/Users/$USER/apache-maven-3.0.4

export GIT_HOME=/Users/$USER/Technology/git-1.8.4

export SCALA_HOME=/usr/local/scala

export MYSQL_HOME=/usr/local/mysql
#hadoop eco system paths
export HADOOP_HOME=/opt/hadoop
export HBASE_HOME=/opt/hbase
export ZOOKEEPER_HOME=/opt/zookeeper
export SPARK_HOME=/opt/spark
export KAFKA_HOME=/Users/$USER/kafka

export ANDROID_HOME=/Users/$USER/Library/Android/sdk

#Groovy Home
export GROOVY_HOME=/usr/local/opt/groovy/libexec
#ruby gems path
export GEM_PATH=/Users/$USER/.rvm/gems/ruby-1.9.3-p448

export PATH="$ANDROID_HOME/tools:$GROOVY_HOME:$KAFKA_HOME/bin:$MYSQL_HOME/bin:$GEM_PATH/bin:$GIT_HOME:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HBASE_HOME/bin:$ZOOKEEPER_HOME/bin:$ZOOKEEPER_HOME/sbin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SCALA_HOME/bin:$JAVA_HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$M2_HOME/bin:$MONGO_HOME/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# customize command prompt
#export PS1="| ghstreddy : | $ "

#Aliases
# General
alias ll='ls -all'
alias ..='cd ..'
alias .='echo $PWD'
alias ~='cd ~'

# Maven
## seems like the the parallel threads one doing extra work, as its running the stories twice some times. i guess its forgot to record while running in parallel threads mode.
#alias mci='mvn -T 4 clean install'
alias mci='mvn clean install'
alias mc='mvn clean'
alias mec='mvn eclipse:clean'
alias mee='mvn eclipse:eclipse -DdownloadSources=true'
alias release-prepare='mvn -T 4 release:prepare'

# git
alias graph='git log --graph --decorate --all'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias log='git log --oneline -n 10'
alias commit='git commit -m '$1''
alias push='git push origin $1'
alias force-push='git push -f origin $1'
alias cherry-pick='git cherry-pick $1'
alias reset='git reset --hard'
alias gg='git gui &'


export M2_HOME=/Users/$USER/apache-maven-3.0.4

#maven 3.0.4
function maven3.0.4(){
  export M2_HOME=/Users/$USER/apache-maven-3.0.4
  export PATH="$JAVA_HOME/bin:$PATH"
}

#maven 3.2.3
function maven3.3.9(){
  export M2_HOME=/Users/$USER/apache-maven-3.3.9
  export PATH="$M2_HOME/bin:$PATH"
}

#Maven Options
export MAVEN_OPTS='-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/Users/$USER/ -Xmx2048m -XX:MaxPermSize=1024m -Djava.net.preferIPv4Stack=true'

#JDK 1.6
function java6(){
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
}

#JDK 1.7
function java7(){
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
}

#JDK 1.8
function java8(){
maven3.3.9
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
}

#JDK 1.9
function java9(){
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.9.0.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
}

#start kafka
function start-kafka(){
  java8
  nohup zookeeper-server-start.sh /Users/$USER/kafka/config/zookeeper.properties &
  echo 'Starting ZooKeeper ...'
  sleep 2
  nohup kafka-server-start.sh /Users/$USER/kafka/config/server1.properties &
  echo 'Starting Server 1 ...'
  sleep 2
  nohup kafka-server-start.sh /Users/$USER/kafka/config/server2.properties &
  echo 'Starting Server 2 ...'
  sleep 2
  nohup kafka-server-start.sh /Users/$USER/kafka/config/server3.properties &
  echo 'Starting Server 3 ...'
  sleep 2
  echo 'All Services Started ...'
}

#stop kafka
function stop-kafka(){
  java8
  kafka-server-stop.sh
  echo 'Stopping server 1 ...'
  sleep 1
  kafka-server-stop.sh
  echo 'Stopping server 2 ...'
  sleep 1
  kafka-server-stop.sh
  echo 'Stopping server 3 ...'
  sleep 3
  zookeeper-server-stop.sh
  sleep 3
  echo 'All Services Stopped ...'
}
