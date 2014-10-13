# Simple Makefile for creating a native binary and a legacy jar file with gcj.
JAVAC=javac
JAVAC_FLAGS=

GCJ=$(JAVAC)
GCJ_FLAGS=$(JAVAC_FLAGS)

JAR=jar

PROGRAM=snark
MAINCLASS=org.klomp.snark.cmd.SnarkApplication

SOURCES= \
org/klomp/snark/BitField.java \
org/klomp/snark/ConnectionAcceptor.java \
org/klomp/snark/CoordinatorListener.java \
org/klomp/snark/HttpAcceptor.java \
org/klomp/snark/MetaInfo.java \
org/klomp/snark/Message.java \
org/klomp/snark/Peer.java \
org/klomp/snark/PeerID.java \
org/klomp/snark/PeerAcceptor.java \
org/klomp/snark/PeerCheckerTask.java \
org/klomp/snark/PeerConnectionIn.java \
org/klomp/snark/PeerConnectionOut.java \
org/klomp/snark/PeerListener.java \
org/klomp/snark/PeerMonitorTask.java \
org/klomp/snark/PeerCoordinator.java \
org/klomp/snark/PeerState.java \
org/klomp/snark/Request.java \
org/klomp/snark/Snark.java \
org/klomp/snark/SnarkShutdown.java \
org/klomp/snark/ShutdownListener.java \
org/klomp/snark/Storage.java \
org/klomp/snark/StorageListener.java \
org/klomp/snark/Tracker.java \
org/klomp/snark/TrackerClient.java \
org/klomp/snark/TrackerInfo.java \
org/klomp/snark/bencode/BEValue.java \
org/klomp/snark/bencode/BEncoder.java \
org/klomp/snark/bencode/BDecoder.java \
org/klomp/snark/bencode/InvalidBEncodingException.java \
org/klomp/snark/StaticSnark.java

STATIC_MAINCLASS=org.klomp.snark.StaticSnark

GNOME_SOURCES=$(SOURCES) org/klomp/snark/SnarkGnome.java \
	org/klomp/snark/GnomeInfoWindow.java \
	org/klomp/snark/GnomePeerList.java
GNOME_MAINCLASS=org.klomp.snark.SnarkGnome

$(PROGRAM).jar: $(PROGRAM)-classes Manifest
	$(JAR) cfm $(PROGRAM).jar Manifest -C dist/classes/ .

$(PROGRAM)-classes: $(SOURCES)
	$(JAVAC) $(JAVAC_FLAGS) -d dist/classes $(SOURCES)

Manifest:
	echo "Main-Class: $(MAINCLASS)" > Manifest

all: $(PROGRAM).jar

clean:
	rm -rf dist/classes/* Manifest $(PROGRAM).jar

.PHONY : all clean $(PROGRAM)-classes
