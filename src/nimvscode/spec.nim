from vscodeApi import VscodeExtensionContext, VscodeWorkspaceConfiguration,
    VscodeOutputChannel,
    VscodeWorkspaceFolder
from jsre import RegExp
from jsNode import Map, Array
# import jsNodeCp, elrpc

type
  Backend* = cstring
  Timestamp* = cint
  NimsuggestId* = cstring

  ProjectFileInfo* = ref object
    wsFolder*: VscodeWorkspaceFolder
    filePath*: cstring

  ProjectMappingInfo* = ref object
    fileRegex*: RegExp
    projectPath*: cstring

  ExtensionState* = ref object
    ctx*: VscodeExtensionContext

    config*: VscodeWorkspaceConfiguration

    # TODO - rename to binPathsCache
    pathsCache*: Map[cstring, cstring]

    # TODO - cached from config parsing, lift into separate object
    projects*: Array[ProjectFileInfo]
    projectMapping*: Array[ProjectMappingInfo]

    channel*: VscodeOutputChannel

# type
#   SolutionKind* {.pure.} = enum
#     skSingleFile, skFolder, skWorkspace

#   NimsuggestProcess* = ref object
#     process*: ChildProcess
#     rpc*: EPCPeer
#     startingPath*: cstring
#     projectPath*: cstring
#     backend*: Backend
#     nimble*: VscodeUri
#     updateTime*: Timestamp
  
#   ProjectKind* {.pure.} = enum
#     pkNim, pkNims, pkNimble

#   ProjectSource* {.pure.} = enum
#     psDetected, psUserDefined

#   Project* = ref object
#     uri*: VscodeUri
#     source*: ProjectSource
#     nimsuggest*: NimsuggestId
#     hasNimble*: bool
#     matchesNimble*: bool
#     case kind*: ProjectKind
#     of pkNim:
#       hasCfg*: bool
#       hasNims*: bool
#     of pkNims, pkNimble: discard

#   ProjectCandidateKind* {.pure.} = enum
#     pckNim, pckNims, pckNimble

#   ProjectCandidate* = ref object
#     uri*: VscodeUri
#     kind*: ProjectCandidateKind