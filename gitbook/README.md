---
description: NETCONF Configuration Protocol //NETCONF配置协议
---

# RFC4741

### 摘要

The Network Configuration Protocol (NETCONF) defined in this document provides mechanisms to install, manipulate, and delete the configuration of network devices. It uses an Extensible Markup Language (XML)-based data encoding for the configuration data as well as the protocol messages. The NETCONF protocol operations are realized on top of a simple Remote Procedure Call (RPC) layer.

本文档中定义的网络配置协议（NETCONF）提供了安装、操作和删除网络设备配置的机制。它对配置数据和协议消息使用基于可扩展标记语言（XML）的数据编码。NETCONF协议操作是在简单远程过程调用（RPC）层上实现的。



## **1. 介绍**

The NETCONF protocol defines a simple mechanism through which a network device can be managed, configuration data information can be retrieved, and new configuration data can be uploaded and manipulated. The protocol allows the device to expose a full, formal application programming interface (API). Applications can use this straightforward API to send and receive full and partial configuration data sets.

NETCONF协议定义了一种简单的机制，通过该机制可以管理网络设备、检索配置数据信息以及上载和操作新的配置数据。该协议允许设备公开完整、正式的应用程序编程接口（API）。应用程序可以使用这个简单的API发送和接收完整和部分配置数据集。

The NETCONF protocol uses a remote procedure call (RPC) paradigm. A client encodes an RPC in XML \[1] and sends it to a server using a secure, connection-oriented session. The server responds with a reply encoded in XML. The contents of both the request and the response are fully described in XML DTDs or XML schemas, or both, allowing both parties to recognize the syntax constraints imposed on the exchange.

NETCONF协议使用远程过程调用（RPC）范例。客户端用XML\[1]对RPC进行编码，并使用安全的、面向连接的会话将其发送到服务器。服务器用XML编码的回复进行响应。请求和响应的内容都用XML DTD或XML模式（或两者）完全描述，允许双方识别施加在交换上的语法约束。

A key aspect of NETCONF is that it allows the functionality of the management protocol to closely mirror the native functionality of the device. This reduces implementation costs and allows timely access to new features. In addition, applications can access both the syntactic and semantic content of the device's native user interface.

NETCONF的一个关键方面是，它允许管理协议的功能紧密镜像设备的本机功能。这降低了实施成本，并允许及时访问新功能。此外，应用程序可以访问设备本机用户界面的语法和语义内容。

NETCONF allows a client to discover the set of protocol extensions supported by a server. These "capabilities" permit the client to adjust its behavior to take advantage of the features exposed by the device. The capability definitions can be easily extended in a noncentralized manner. Standard and non-standard capabilities can be defined with semantic and syntactic rigor. Capabilities are discussed in Section 8.

NETCONF允许客户端发现服务器支持的协议扩展集。这些“功能”允许客户端调整其行为，以利用设备公开的功能。能力定义可以以非集中的方式轻松扩展。标准和非标准功能可以通过严格的语义和语法定义。功能在第8节中讨论。

The NETCONF protocol is a building block in a system of automated configuration. XML is the lingua franca of interchange, providing a flexible but fully specified encoding mechanism for hierarchical content. NETCONF can be used in concert with XML-based transformation technologies, such as XSLT \[8], to provide a system for automated generation of full and partial configurations. The system can query one or more databases for data about networking topologies, links, policies, customers, and services. This data can be transformed using one or more XSLT scripts from a task-oriented, vendor-independent data schema into a form that is specific to the vendor, product, operating system, and software release. The resulting data can be passed to the device using the NETCONF protocol.

NETCONF协议是自动配置系统中的一个构建块。XML是交换的通用语言，为分层内容提供了灵活但完全指定的编码机制。NETCONF可以与基于XML的转换技术（如XSLT\[8]）配合使用，以提供一个自动生成完整和部分配置的系统。系统可以查询一个或多个数据库中有关网络拓扑、链接、策略、客户和服务的数据。可以使用一个或多个XSLT脚本将这些数据从面向任务、独立于供应商的数据模式转换为特定于供应商、产品、操作系统和软件版本的形式。生成的数据可以使用NETCONF协议传递到设备。

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 \[3].

本文件中的关键词“必须”、“不得”、“要求”、“应”、“不应”、“应”、“不应”、“建议”、“可”和“可选”应按照RFC 2119\[3]中所述进行解释。



### **1.1. 协议概述**

NETCONF uses a simple RPC-based mechanism to facilitate communication between a client and a server. The client can be a script or application typically running as part of a network manager. The server is typically a network device. The terms "device" and "server" are used interchangeably in this document, as are "client" and "application".

NETCONF使用一种简单的基于RPC的机制来促进客户端和服务器之间的通信。客户端可以是脚本或应用程序，通常作为网络管理器的一部分运行。服务器通常是一个网络设备。术语“设备”和“服务器”在本文档中互换使用，“客户端”和“应用程序”也是如此。

A NETCONF session is the logical connection between a network administrator or network configuration application and a network device. A device MUST support at least one NETCONF session and SHOULD support multiple sessions. Global configuration attributes can be changed during any authorized session, and the effects are visible in all sessions. Session-specific attributes affect only the session in which they are changed.

NETCONF会话是网络管理员或网络配置应用程序与网络设备之间的逻辑连接。设备必须至少支持一个NETCONF会话，并且应支持多个会话。全局配置属性可以在任何授权会话期间更改，并且效果在所有会话中都可见。特定于会话的属性仅影响更改它们的会话。

NETCONF can be conceptually partitioned into four layers:

NETCONF在概念上可分为四层：

```
              Layer                      Example
         +-------------+      +-----------------------------+
     (4) |   Content   |      |     Configuration data      |
         +-------------+      +-----------------------------+
                |                           |
         +-------------+      +-----------------------------+
     (3) | Operations  |      | <get-config>, <edit-config> |
         +-------------+      +-----------------------------+
                |                           |
         +-------------+      +-----------------------------+
     (2) |     RPC     |      |    <rpc>, <rpc-reply>       |
         +-------------+      +-----------------------------+
                |                           |
         +-------------+      +-----------------------------+
     (1) |  Transport  |      |   BEEP, SSH, SSL, console   |
         |   Protocol  |      |                             |
         +-------------+      +-----------------------------+
        
```

1\. The transport protocol layer provides a communication path between the client and server. NETCONF can be layered over any transport protocol that provides a set of basic requirements. Section 2 discusses these requirements.

1\. 传输协议层提供客户端和服务器之间的通信路径。NETCONF可以在提供一组基本需求的任何传输协议上分层。第2节讨论了这些要求。

2\. The RPC layer provides a simple, transport-independent framing mechanism for encoding RPCs. Section 4 documents this protocol.

2\. RPC层为RPC编码提供了一种简单、独立于传输的帧机制。第4节记录了本协议。

3\. The operations layer defines a set of base operations invoked as RPC methods with XML-encoded parameters. Section 7 details the list of base operations.

3\. 操作层定义了一组基本操作，这些操作作为带有XML编码参数的RPC方法调用。第7节详细介绍了基本操作列表。

4\. The content layer is outside the scope of this document. Given the current proprietary nature of the configuration data being manipulated, the specification of this content depends on the NETCONF implementation. It is expected that a separate effort to specify a standard data definition language and standard content will be undertaken.

4\. 内容层不在本文档的范围内。鉴于所操纵的配置数据的当前专有性质，此内容的规范取决于NETCONF实现。预计将单独努力指定标准数据定义语言和标准内容。

### **1.2. Capabilities/ 能力**

A NETCONF capability is a set of functionality that supplements the base NETCONF specification. The capability is identified by a uniform resource identifier (URI). These URIs should follow the guidelines as described in Section 8.

NETCONF功能是一组补充基本NETCONF规范的功能。该功能由统一资源标识符（URI）标识。这些URI应遵循第8节所述的指南。

Capabilities augment the base operations of the device, describing both additional operations and the content allowed inside operations. The client can discover the server's capabilities and use any additional operations, parameters, and content defined by those capabilities.

功能增强了设备的基本操作，描述了附加操作和操作中允许的内容。客户端可以发现服务器的功能，并使用这些功能定义的任何其他操作、参数和内容。

The capability definition may name one or more dependent capabilities. To support a capability, the server MUST support any capabilities upon which it depends.

能力定义可以命名一个或多个相关能力。要支持某项功能，服务器必须支持它所依赖的任何功能。

Section 8 defines the capabilities exchange that allows the client to discover the server's capabilities. Section 8 also lists the set of capabilities defined in this document.

第8节定义了允许客户端发现服务器功能的功能交换。第8节还列出了本文件中定义的一组功能。

Additional capabilities can be defined at any time in external documents, allowing the set of capabilities to expand over time. Standards bodies may define standardized capabilities, and implementations may define proprietary ones. A capability URI MUST sufficiently distinguish the naming authority to avoid naming collisions.

可以随时在外部文档中定义其他功能，从而允许功能集随时间扩展。标准机构可以定义标准化功能，实现可以定义专有功能。功能URI必须充分区分命名机构，以避免命名冲突。

### **1.3. 配置和状态数据的分离**

The information that can be retrieved from a running system is separated into two classes, configuration data and state data. Configuration data is the set of writable data that is required to transform a system from its initial default state into its current state. State data is the additional data on a system that is not

可以从正在运行的系统中检索的信息分为两类：配置数据和状态数据。配置数据是将系统从初始默认状态转换为当前状态所需的一组可写数据。状态数据是系统上不可用的附加数据

configuration data such as read-only status information and collected statistics. When a device is performing configuration operations, a number of problems would arise if state data were included:

配置数据，如只读状态信息和收集的统计信息。当设备执行配置操作时，如果包含状态数据，则会出现许多问题：

o Comparisons of configuration data sets would be dominated by irrelevant entries such as different statistics.

o 配置数据集的比较主要是不相关的条目，如不同的统计数据。

o Incoming data could contain nonsensical requests, such as attempts to write read-only data.

o 传入数据可能包含无意义的请求，例如试图写入只读数据。

o The data sets would be large.

o 数据集将会很大。

o Archived data could contain values for read-only data items, complicating the processing required to restore archived data.

o 归档数据可能包含只读数据项的值，从而使恢复归档数据所需的处理复杂化。

To account for these issues, the NETCONF protocol recognizes the difference between configuration data and state data and provides operations for each. The \<get-config> operation retrieves configuration data only, while the \<get> operation retrieves configuration and state data.

为了解决这些问题，NETCONF协议识别配置数据和状态数据之间的差异，并为每种数据提供操作。\<get config>操作仅检索配置数据，而\<get>操作检索配置和状态数据。

Note that the NETCONF protocol is focused on the information required to get the device into its desired running state. The inclusion of other important, persistent data is implementation specific. For example, user files and databases are not treated as configuration data by the NETCONF protocol.

请注意，NETCONF协议主要关注使设备进入所需运行状态所需的信息。包含其他重要的持久性数据是特定于实现的。例如，NETCONF协议不将用户文件和数据库视为配置数据。

If a local database of user authentication data is stored on the device, whether it is included in configuration data is an implementation-dependent matter.

如果用户认证数据的本地数据库存储在设备上，则配置数据中是否包含该数据库取决于实现。



## **2. 传输协议要求**

NETCONF uses an RPC-based communication paradigm. A client sends a series of one or more RPC request operations, which cause the server to respond with a corresponding series of RPC replies.

NETCONF使用基于RPC的通信范例。客户端发送一系列的一个或多个RPC请求操作，这会导致服务器以相应的一系列RPC响应进行响应。

The NETCONF protocol can be layered on any transport protocol that provides the required set of functionality. It is not bound to any particular transport protocol, but allows a mapping to define how it can be implemented over any specific protocol.

NETCONF协议可以在提供所需功能集的任何传输协议上分层。它不绑定到任何特定的传输协议，但允许映射定义如何在任何特定协议上实现它。

The transport protocol MUST provide a mechanism to indicate the session type (client or server) to the NETCONF protocol layer.

传输协议必须提供向NETCONF协议层指示会话类型（客户端或服务器）的机制。

This section details the characteristics that NETCONF requires from the underlying transport protocol.

本节详细介绍了NETCONF对底层传输协议的要求。



### **2.1. 面向连接的操作**

NETCONF is connection-oriented, requiring a persistent connection between peers. This connection must provide reliable, sequenced data delivery.

NETCONF是面向连接的，需要对等方之间的持久连接。此连接必须提供可靠、有序的数据传输。

NETCONF connections are long-lived, persisting between protocol operations. This allows the client to make changes to the state of the connection that will persist for the lifetime of the connection. For example, authentication information specified for a connection remains in effect until the connection is closed.

NETCONF连接是长期的，在协议操作之间保持。这允许客户端对连接的状态进行更改，该更改将持续到连接的生命周期。例如，为连接指定的身份验证信息在连接关闭之前保持有效。

In addition, resources requested from the server for a particular connection MUST be automatically released when the connection closes, making failure recovery simpler and more robust. For example, when a lock is acquired by a client, the lock persists until either it is explicitly released or the server determines that the connection has been terminated. If a connection is terminated while the client holds a lock, the server can perform any appropriate recovery. The lock operation is further discussed in Section 7.5.

此外，当连接关闭时，必须自动释放为特定连接从服务器请求的资源，从而使故障恢复更简单、更可靠。例如，当客户端获取锁时，该锁将一直保持，直到显式释放该锁或服务器确定连接已终止。如果在客户端持有锁时终止连接，则服务器可以执行任何适当的恢复。第7.5节将进一步讨论锁定操作。



### **2.2. 身份验证、完整性和机密性**

NETCONF connections must provide authentication, data integrity, and confidentiality. NETCONF depends on the transport protocol for this capability. A NETCONF peer assumes that appropriate levels of security and confidentiality are provided independently of this document. For example, connections may be encrypted in TLS \[9] or SSH \[10], depending on the underlying protocol.

NETCONF连接必须提供身份验证、数据完整性和机密性。NETCONF依赖于此功能的传输协议。NETCONF对等方假定提供了与本文档无关的适当级别的安全性和机密性。例如，连接可以在TLS\[9]或SSH\[10]中加密，具体取决于底层协议。



### **2.3. 认证**

NETCONF connections must be authenticated. The transport protocol is responsible for authentication. The peer assumes that the connection's authentication information has been validated by the underlying protocol using sufficiently trustworthy mechanisms and that the peer's identity has been sufficiently proven.

NETCONF连接必须经过身份验证。传输协议负责身份验证。对等方假设连接的身份验证信息已由底层协议使用充分可信的机制进行验证，并且对等方的身份已得到充分证明。

One goal of NETCONF is to provide a programmatic interface to the device that closely follows the functionality of the device's native interface. Therefore, it is expected that the underlying protocol uses existing authentication mechanisms defined by the device. For example, a device that supports RADIUS \[11] should allow the use of RADIUS to authenticate NETCONF sessions.

NETCONF的一个目标是为设备提供一个编程接口，该接口紧密遵循设备本机接口的功能。因此，预期基础协议使用设备定义的现有身份验证机制。例如，支持RADIUS\[11]的设备应允许使用RADIUS对NETCONF会话进行身份验证。

The authentication process should result in an identity whose permissions are known to the device. These permissions MUST be enforced during the remainder of the NETCONF session.

身份验证过程应产生设备已知其权限的标识。这些权限必须在NETCONF会话的剩余时间内强制执行。



### **2.4. 强制传输协议**

A NETCONF implementation MUST support the SSH transport protocol mapping \[4].

NETCONF实现必须支持SSH传输协议映射\[4]。



## **3. XML注意事项**

XML serves as the encoding format for NETCONF, allowing complex hierarchical data to be expressed in a text format that can be read, saved, and manipulated with both traditional text tools and tools specific to XML.

XML作为NETCONF的编码格式，允许以文本格式表示复杂的层次结构数据，可以使用传统的文本工具和特定于XML的工具来读取、保存和操作文本格式。

This section discusses a small number of XML-related considerations pertaining to NETCONF.

本节讨论与NETCONF有关的少量XML相关注意事项。



### **3.1. Namespace**

All NETCONF protocol elements are defined in the following namespace:

所有NETCONF协议元素都在以下命名空间中定义：

```
 urn:ietf:params:xml:ns:netconf:base:1.0
```

NETCONF功能名称必须是URI\[5]。第8节讨论了NETCONF功能。

### **3.2. 没有文档类型声明**

Document type declarations MUST NOT appear in NETCONF content.

文档类型声明不得出现在NETCONF内容中。

## **4. RPC Model**



The NETCONF protocol uses an RPC-based communication model. NETCONF peers use \<rpc> and \<rpc-reply> elements to provide transport protocol-independent framing of NETCONF requests and responses.

NETCONF协议使用基于RPC的通信模型。NETCONF对等方使用\<rpc>和\<rpc reply>元素提供NETCONF请求和响应的传输协议独立框架。



### **4.1. \<rpc> Element**

The \<rpc> element is used to enclose a NETCONF request sent from the client to the server.

元素用于封装从客户端发送到服务器的NETCONF请求。

The \<rpc> element has a mandatory attribute "message-id", which is an arbitrary string chosen by the sender of the RPC that will commonly encode a monotonically increasing integer. The receiver of the RPC does not decode or interpret this string but simply saves it to be used as a "message-id" attribute in any resulting \<rpc-reply> message. For example:

\<rpc>元素有一个强制属性“message id”，这是rpc的发送者选择的任意字符串，它通常编码一个单调递增的整数。RPC的接收者不解码或解释此字符串，而只是将其保存为任何结果\<RPC reply>消息中的“消息id”属性。例如：

```
  <rpc message-id="101"
            xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
         <some-method>
           <!-- method parameters here... -->
         </some-method>
       </rpc>
```

如果\<rpc>元素中存在其他属性，则NETCONF对等方必须在\<rpc reply>元素中返回未经修改的属性。

The name and parameters of an RPC are encoded as the contents of the \<rpc> element. The name of the RPC is an element directly inside the \<rpc> element, and any parameters are encoded inside this element.

RPC的名称和参数被编码为\<RPC>元素的内容。RPC的名称是直接位于\<RPC>元素内的元素，任何参数都在该元素内编码。

The following example invokes a method called \<my-own-method>, which has two parameters, \<my-first-parameter>, with a value of "14", and \<another-parameter>, with a value of "fred":

下面的示例调用一个名为\<my own method>的方法，该方法有两个参数，\<my first parameter>，值为“14”，和\<Other parameter>，值为“fred”：

以下示例使用参数“27606-0100”调用方法：

```
  <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <rock-the-house xmlns="http://example.net/rock/1.0">
         <zip-code>27606-0100</zip-code>
       </rock-the-house>
     </rpc>
```

以下示例不带参数调用NETCONF方法：

```
  <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get/>
     </rpc>
```

### **4.2. \<rpc reply>元素**

The \<rpc-reply> message is sent in response to an \<rpc> operation.

\<rpc reply>消息是响应\<rpc>操作而发送的。

The \<rpc-reply> element has a mandatory attribute "message-id", which is equal to the "message-id" attribute of the \<rpc> for which this is a response.

\<rpc reply>元素有一个强制属性“message id”，它等于\<rpc>的“message id”属性，这是对该属性的响应。

A NETCONF peer MUST also return any additional attributes included in the \<rpc> element unmodified in the \<rpc-reply> element.

NETCONF对等方还必须返回\<rpc reply>元素中未修改的\<rpc>元素中包含的任何附加属性。

The response name and response data are encoded as the contents of the \<rpc-reply> element. The name of the reply is an element directly inside the \<rpc-reply> element, and any data is encoded inside this element.

响应名称和响应数据被编码为\<rpc reply>元素的内容。回复的名称是直接位于\<rpc reply>元素内的元素，任何数据都在该元素内编码。

For example:

例如：

The following \<rpc> element invokes the NETCONF \<get> method and includes an additional attribute called "user-id". Note that the "user-id" attribute is not in the NETCONF namespace. The returned \<rpc-reply> element returns the "user-id" attribute, as well as the requested content.

下面的\<rpc>元素调用NETCONF\<get>方法，并包含一个名为“user id”的附加属性。请注意，“用户id”属性不在NETCONF命名空间中。返回的\<rpc reply>元素返回“user id”属性以及请求的内容。

```
<rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0"
          xmlns:ex="http://example.net/content/1.0"
          ex:user-id="fred">
       <get/>
     </rpc>
        
<rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0"
          xmlns:ex="http://example.net/content/1.0"
          ex:user-id="fred">
       <data>
         <!-- contents here... -->
       </data>
     </rpc-reply>      
```

### **4.3. \<rpc error>元素**

The \<rpc-error> element is sent in \<rpc-reply> messages if an error occurs during the processing of an \<rpc> request.

如果在处理\<rpc>请求期间发生错误，则在\<rpc reply>消息中发送\<rpc error>元素。

```
 If a server encounters multiple errors during the processing of an
   <rpc> request, the <rpc-reply> MAY contain multiple <rpc-error>
   elements.  However, a server is not required to detect or report more
```

如果请求包含多个错误，则有多个\<rpc error>元素。服务器不需要按特定顺序检查特定错误条件。如果在处理过程中出现任何错误条件，服务器必须返回\<rpc error>元素，如果在处理过程中出现任何警告条件，则应返回\<rpc error>元素。

A server MUST NOT return application-level- or data-model-specific error information in an \<rpc-error> element for which the client does not have sufficient access rights.

服务器不得在客户端没有足够访问权限的\<rpc error>元素中返回特定于应用程序级别或数据模型的错误信息。

The \<rpc-error> element includes the following information:

\<rpc error>元素包含以下信息：

error-type: Defines the conceptual layer that the error occurred. Enumeration. One of:

错误类型：定义发生错误的概念层。枚举。什么之中的一个：

\*transport  /运输

\* rpc           /rpc

\* protocol  /协议

\* application /应用

错误标记：包含标识错误条件的字符串。允许值见附录A。

error-severity: Contains a string identifying the error severity, as determined by the device. One of:

错误严重性：包含一个字符串，标识由设备确定的错误严重性。什么之中的一个：

\* error

\* warning

error app tag：包含一个字符串，标识特定于数据模型或特定于实现的错误条件（如果存在）。如果没有合适的应用程序错误标记与特定错误条件相关联，则此元素将不存在。

error-path: Contains the absolute XPath \[2] expression identifying the element path to the node that is associated with the error being reported in a particular rpc-error element. This element will not be present if no appropriate payload element can be associated with a particular error condition, or if the 'bad-element' QString returned in the 'error-info' container is sufficient to identify the node associated with the error. When

错误路径：包含绝对XPath\[2]表达式，该表达式标识与特定rpc错误元素中报告的错误相关联的节点的元素路径。如果没有合适的有效负载元素可以与特定错误条件相关联，或者如果“error info”容器中返回的“bad element”QString足以识别与错误关联的节点，则此元素将不存在。什么时候

the XPath expression is interpreted, the set of namespace declarations are those in scope on the rpc-error element, including the default namespace.

解释XPath表达式时，名称空间声明集是rpc错误元素范围内的声明，包括默认名称空间。

error-message: Contains a string suitable for human display that describes the error condition. This element will not be present if no appropriate message is provided for a particular error condition. This element SHOULD include an xml:lang attribute as defined in \[1] and discussed in \[12].

错误消息：包含一个适合人工显示的字符串，用于描述错误条件。如果没有为特定错误条件提供适当的消息，则此元素将不存在。此元素应包括\[1]中定义并在\[12]中讨论的xml:lang属性。

error-info: Contains protocol- or data-model-specific error content. This element will not be present if no such error content is provided for a particular error condition. The list in Appendix A defines any mandatory error-info content for each error. After any protocol-mandated content, a data model definition may mandate that certain application-layer error information be included in the error-info container. An implementation may include additional elements to provide extended and/or implementation-specific debugging information.

错误信息：包含协议或数据模型特定的错误内容。如果没有为特定错误条件提供此类错误内容，则此元素将不存在。附录A中的列表定义了每个错误的任何强制性错误信息内容。在任何协议授权的内容之后，数据模型定义可以授权将某些应用层错误信息包括在错误信息容器中。实现可以包括额外的元素，以提供扩展的和/或实现特定的调试信息。

附录A列举了标准NETCONF错误。

Example：

如果接收到的\<rpc>元素没有消息id属性，则返回错误。注意，只有在这种情况下，NETCONF对等方才可以忽略\<rpc reply>元素中的message id属性。

```
     <rpc xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
       </get-config>
     </rpc>
        
    <rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <rpc-error>
         <error-type>rpc</error-type>
         <error-tag>missing-attribute</error-tag>
         <error-severity>error</error-severity>
         <error-info>
           <bad-attribute>message-id</bad-attribute>
           <bad-element>rpc</bad-element>
         </error-info>
       </rpc-error>
     </rpc-reply>
```

下面的\<rpc reply>说明了返回多个\<rpc error>元素的情况。

Note that the data models used in the examples in this section use the \<name> element to distinguish between multiple instances of the \<interface> element.

请注意，本节示例中使用的数据模型使用\<name>元素来区分\<interface>元素的多个实例。

```
  <rpc-reply message-id="101"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0"
       xmlns:xc="urn:ietf:params:xml:ns:netconf:base:1.0">
       <rpc-error>
         <error-type>application</error-type>
         <error-tag>invalid-value</error-tag>
         <error-severity>error</error-severity>
         <error-message xml:lang="en">
           MTU value 25000 is not within range 256..9192
         </error-message>
         <error-info>
           <top xmlns="http://example.com/schema/1.2/config">
             <interface>
               <name>Ethernet0/0</name>
               <mtu>25000</mtu>
             </interface>
           </top>
         </error-info>
       </rpc-error>
       <rpc-error>
         <error-type>application</error-type>
         <error-tag>invalid-value</error-tag>
         <error-severity>error</error-severity>
         <error-message xml:lang="en">
           Invalid IP address for interface Ethernet1/0
         </error-message>
         <error-info>
           <top xmlns="http://example.com/schema/1.2/config">
             <interface xc:operation="replace">
               <name>Ethernet1/0</name>
               <address>
                 <name>1.4</name>
                 <prefix-length>24</prefix-length>
               </address>
             </interface>
           </top>
         </error-info>
       </rpc-error>
     </rpc-reply>
        
```

### **4.4. \<ok>元素**

The \<ok> element is sent in \<rpc-reply> messages if no errors or warnings occurred during the processing of an \<rpc> request. For example:

如果在处理\<rpc>请求期间未发生错误或警告，则\<ok>元素将在\<rpc reply>消息中发送。例如：

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <ok/>
     </rpc-reply>
        
```

### **4.5. Pipelining**

NETCONF \<rpc> requests MUST be processed serially by the managed device. Additional \<rpc> requests MAY be sent before previous ones have been completed. The managed device MUST send responses only in the order the requests were received.

NETCONF\<rpc>请求必须由受管设备串行处理。其他\<rpc>请求可能在以前的请求完成之前发送。受管设备必须仅按照接收请求的顺序发送响应。

## **5. 配置模型**

NETCONF provides an initial set of operations and a number of capabilities that can be used to extend the base. NETCONF peers exchange device capabilities when the session is initiated as described in Section 8.1.

NETCONF提供了一组初始操作和一些可用于扩展基础的功能。如第8.1节所述，当会话启动时，NETCONF对等交换设备功能。



### **5.1. 配置数据存储**

NETCONF defines the existence of one or more configuration datastores and allows configuration operations on them. A configuration datastore is defined as the complete set of configuration data that is required to get a device from its initial default state into a desired operational state. The configuration datastore does not include state data or executive commands.

NETCONF定义一个或多个配置数据存储的存在，并允许对其进行配置操作。配置数据存储定义为使设备从初始默认状态进入所需操作状态所需的完整配置数据集。配置数据存储不包括状态数据或执行命令。

Only the \<running> configuration datastore is present in the base model. Additional configuration datastores may be defined by capabilities. Such configuration datastores are available only on devices that advertise the capabilities.

基本模型中仅存在\<running>配置数据存储。其他配置数据存储可能由功能定义。此类配置数据存储仅在发布功能的设备上可用。

o Running: The complete configuration currently active on the network device. Only one configuration datastore of this type exists on the device, and it is always present. NETCONF protocol operations refer to this datastore using the \<running> element.

o 正在运行：网络设备上当前处于活动状态的完整配置。设备上仅存在一个此类型的配置数据存储，并且始终存在。NETCONF协议操作使用\<running>元素引用此数据存储。

The capabilities in Sections 8.3 and 8.7 define the \<candidate> and \<startup> configuration datastores, respectively.

第8.3节和第8.7节中的功能分别定义了\<candidate>和\<startup>配置数据存储。

### **5.2. Data Modeling /数据建模**

Data modeling and content issues are outside the scope of the NETCONF protocol. An assumption is made that the device's data model is well-known to the application and that both parties are aware of issues such as the layout, containment, keying, lookup, replacement, and management of the data, as well as any other constraints imposed by the data model.

数据建模和内容问题不在NETCONF协议的范围内。假设应用程序熟知设备的数据模型，并且双方都知道数据的布局、包含、键控、查找、替换和管理等问题，以及数据模型施加的任何其他约束。

NETCONF carries configuration data inside the \<config> element that is specific to device's data model. The protocol treats the contents of that element as opaque data. The device uses capabilities to announce the set of data models that the device implements. The capability definition details the operation and constraints imposed by data model.

NETCONF在\<config>元素中携带特定于设备数据模型的配置数据。协议将该元素的内容视为不透明数据。设备使用功能宣布设备实现的数据模型集。能力定义详细说明了数据模型施加的操作和约束。

Devices and managers may support multiple data models, including both standard and proprietary data models.

设备和管理器可能支持多种数据模型，包括标准和专有数据模型。



## **6. 子树过滤**

### **6.1. Overview**

XML subtree filtering is a mechanism that allows an application to select particular XML subtrees to include in the \<rpc-reply> for a \<get> or \<get-config> operation. A small set of filters for inclusion, simple content exact-match, and selection is provided, which allows some useful, but also very limited, selection mechanisms. The agent does not need to utilize any data-model-specific semantics during processing, allowing for simple and centralized implementation strategies.

XML子树过滤是一种机制，允许应用程序为\<get>或\<get config>操作选择要包含在\<rpc reply>中的特定XML子树。提供了一组用于包含、简单内容精确匹配和选择的过滤器，允许一些有用但也非常有限的选择机制。代理在处理过程中不需要使用任何特定于数据模型的语义，从而实现简单而集中的实现策略。

Conceptually, a subtree filter is comprised of zero or more element subtrees, which represent the filter selection criteria. At each containment level within a subtree, the set of sibling nodes is logically processed by the server to determine if its subtree and path of elements to the root are included in the filter output.

从概念上讲，子树过滤器由零个或多个元素子树组成，这些子树表示过滤器选择标准。在子树中的每个包含级别上，服务器对同级节点集进行逻辑处理，以确定其子树和元素到根的路径是否包含在过滤器输出中。

All elements present in a particular subtree within a filter must match associated nodes present in the server's conceptual data model. XML namespaces may be specified (via 'xmlns' declarations) within the filter data model. If they are, the declared namespace must first exactly match a namespace supported by the server. Note that prefix values for qualified namespaces are not relevant when comparing filter elements to elements in the underlying data model. Only data associated with a specified namespace will be included in the filter output.

筛选器中特定子树中的所有元素必须与服务器概念数据模型中的关联节点匹配。可以在筛选器数据模型中指定XML名称空间（通过“xmlns”声明）。如果是，则声明的命名空间必须首先与服务器支持的命名空间完全匹配。请注意，在将筛选器元素与基础数据模型中的元素进行比较时，限定名称空间的前缀值不相关。筛选器输出中将仅包含与指定命名空间关联的数据。

Each node specified in a subtree filter represents an inclusive filter. Only associated nodes in underlying data model(s) within the specified configuration datastore on the server are selected by the filter. A node must exactly match the namespace and hierarchy of elements given in the filter data, except that the filter absolute path name is adjusted to start from the layer below \<filter>.

子树筛选器中指定的每个节点表示一个包含筛选器。筛选器仅选择服务器上指定配置数据存储中的基础数据模型中的关联节点。节点必须与筛选器数据中给定的元素的名称空间和层次结构完全匹配，但筛选器绝对路径名称被调整为从\<filter>下面的层开始。

Response messages contain only the subtrees selected by the filter. Any selection criteria that were present in the request, within a particular selected subtree, are also included in the response. Note that some elements expressed in the filter as leaf nodes will be expanded (i.e., subtrees included) in the filter output. Specific data instances are not duplicated in the response in the event that the request contains multiple filter subtree expressions that select the same data.

响应消息仅包含筛选器选择的子树。响应中还包括请求中存在的、特定选定子树中的任何选择标准。请注意，过滤器中表示为叶节点的某些元素将在过滤器输出中展开（即包括子树）。如果请求包含多个选择相同数据的筛选器子树表达式，则特定数据实例不会在响应中重复。

### **6.2. Subtree Filter Components / 子树过滤器组件**

A subtree filter is comprised of XML elements and their XML attributes. There are five types of components that may be present in a subtree filter:

子树过滤器由XML元素及其XML属性组成。子树筛选器中可能存在五种类型的组件：

o Namespace Selection / 名称空间选择

o Attribute Match Expressions / 属性匹配表达式

o Containment Nodes / 包容节点

o Selection Nodes / 选择节点

o Content Match Nodes / 内容匹配节点





#### **6.2.1. Namespace Selection**



If namespaces are used, then the filter output will only include elements from the specified namespace. A namespace is considered to match (for filter purposes) if the content of the 'xmlns' attributes are the same in the filter and the underlying data model. Note that namespace selection cannot be used by itself. At least one element must be specified in the filter any elements to be included in the filter output.

如果使用名称空间，则过滤器输出将仅包括指定名称空间中的元素。如果筛选器和基础数据模型中的“xmlns”属性的内容相同，则认为命名空间匹配（出于筛选目的）。请注意，名称空间选择本身不能使用。必须在筛选器中至少指定一个元素—要包括在筛选器输出中的任何元素。

Example:

```
     <filter type="subtree">
       <top xmlns="http://example.com/schema/1.2/config"/>
     </filter>
        
```

In this example, the \<top> element is a selection node, and only this node and any child nodes (from the underlying data model) in the 'http://example.com/schema/1.2/config' namespace will be included in the filter output.

在本例中，\<top>元素是一个选择节点，并且只有该节点和任何子节点（来自基础数据模型）位于http://example.com/schema/1.2/config'命名空间将包含在筛选器输出中。

#### **6.2.2. Attribute Match Expressions  / 属性匹配表达式**

An attribute that appears in a subtree filter is part of an "attribute match expression". Any number of (unqualified or qualified) XML attributes may be present in any type of filter node. In addition to the selection criteria normally applicable to that node, the selected data must have matching values for every attribute specified in the node. If an element is not defined to include a specified attribute, then it is not selected in the filter output.

出现在子树筛选器中的属性是“属性匹配表达式”的一部分。任何类型的筛选器节点中都可能存在任意数量的（非限定的或限定的）XML属性。除了通常适用于该节点的选择标准外，所选数据必须具有节点中指定的每个属性的匹配值。如果未将元素定义为包含指定属性，则不会在过滤器输出中选择该元素。

Example:

```
     <filter type="subtree">
       <t:top xmlns:t="http://example.com/schema/1.2/config">
         <t:interfaces>
           <t:interface t:ifName="eth0"/>
         </t:interfaces>
       </t:top>
     </filter>
        
```

In this example, the \<top>, \<interfaces>, and \<interface> elements are containment nodes, and 'ifName' is an attribute match expression. Only 'interface' nodes in the 'http://example.com/schema/1.2/config' namespace that have an 'ifName' attribute with the value 'eth0' and occur within 'interfaces' nodes within 'top' nodes will be included in the filter output.

在本例中，\<top>、\<interfaces>和\<interface>元素是包含节点，“ifName”是属性匹配表达式。仅“接口”节点位于http://example.com/schema/1.2/config'具有值为'eth0'的'ifName'属性且出现在'top'节点内的'interfaces'节点中的命名空间将包含在筛选器输出中。

#### **6.2.3. Containment Nodes  /  包容节点**

Nodes that contain child elements within a subtree filter are called "containment nodes". Each child element can be any type of node, including another containment node. For each containment node specified in a subtree filter, all data model instances that exactly match the specified namespaces, element hierarchy, and any attribute match expressions are included in the filter output.

子树过滤器中包含子元素的节点称为“包含节点”。每个子元素可以是任何类型的节点，包括另一个包含节点。对于子树过滤器中指定的每个包含节点，过滤器输出中包括与指定名称空间、元素层次结构和任何属性匹配表达式完全匹配的所有数据模型实例。

例子：

```
     <filter type="subtree">
       <top xmlns="http://example.com/schema/1.2/config">
         <users/>
       </top>
     </filter>
        
```

In this example, the \<top> element is a containment node.

在本例中，\<top>元素是一个包含节点。



#### **6.2.4. 选择节点**

An empty leaf node within a filter is called a "selection node", and it represents an "explicit selection" filter on the underlying data model. Presence of any selection nodes within a set of sibling nodes will cause the filter to select the specified subtree(s) and suppress automatic selection of the entire set of sibling nodes in the underlying data model. For filtering purposes, an empty leaf node can be declared either with an empty tag (e.g., \<foo/>) or with explicit start and end tags (e.g., \<foo> \</foo>). Any whitespace characters are ignored in this form.

过滤器中的空叶节点称为“选择节点”，它表示基础数据模型上的“显式选择”过滤器。如果一组同级节点中存在任何选择节点，则过滤器将选择指定的子树，并禁止在基础数据模型中自动选择整个同级节点集。出于筛选目的，可以使用空标记（例如，\<foo/>）或显式的开始和结束标记（例如，\<foo>\</foo>）声明空叶节点。在此表单中忽略任何空白字符。

Example:

例子：

```
     <filter type="subtree">
       <top xmlns="http://example.com/schema/1.2/config">
         <users/>
       </top>
     </filter>
        
```

In this example, the \<top> element is a containment node, and the \<users> element is a selection node. Only 'users' nodes in the 'http://example.com/schema/1.2/config' namespace that occur within a 'top' element that is the root of the configuration datastore will be included in the filter output.

在本例中，\<top>元素是包含节点，\<users>元素是选择节点。仅“用户”节点位于http://example.com/schema/1.2/config'在作为配置数据存储的根的'top'元素中出现的命名空间将包含在筛选器输出中。

#### **6.2.5. Content Match Nodes /  内容匹配节点**

A leaf node that contains simple content is called a "content match node". It is used to select some or all of its sibling nodes for filter output, and it represents an exact-match filter on the leaf node element content. The following constraints apply to content match nodes:

包含简单内容的叶节点称为“内容匹配节点”。它用于选择过滤器输出的部分或全部同级节点，并表示叶节点元素内容上的精确匹配过滤器。以下约束适用于内容匹配节点：

o A content match node must not contain nested elements (i.e., must resolve to a simpleType in the XML Schema Definition (XSD)).

o 内容匹配节点不得包含嵌套元素（即，必须解析为XML架构定义（XSD）中的simpleType）。

o Multiple content match nodes (i.e., sibling nodes) are logically combined in an "AND" expression.

o 多个内容匹配节点（即同级节点）在逻辑上组合在一个“和”表达式中。

o Filtering of mixed content is not supported. /  不支持筛选混合内容。

o Filtering of list content is not supported. /  不支持筛选列表内容。

o Filtering of whitespace-only content is not supported. /  不支持过滤纯空白内容。

o A content match node must contain non-whitespace characters. An empty element (e.g., \<foo>\</foo>) will be interpreted as a selection node (e.g., \<foo/>).

o 内容匹配节点必须包含非空白字符。空元素（例如，\<foo>\</foo>）将被解释为选择节点（例如，\<foo/>）。

o Leading and trailing whitespace characters are ignored, but any whitespace characters within a block of text characters are not ignored or modified.

o 将忽略前导和尾随空白字符，但不会忽略或修改文本字符块中的任何空白字符。

If all specified sibling content match nodes in a subtree filter expression are 'true', then the filter output nodes are selected in the following manner:

如果子树筛选器表达式中所有指定的同级内容匹配节点均为“true”，则将按以下方式选择筛选器输出节点：

o Each content match node in the sibling set is included in the filter output. / 同级集中的每个内容匹配节点都包含在过滤器输出中。

o If any containment nodes are present in the sibling set, then they are processed further and included if any nested filter criteria are also met. / 如果同级集中存在任何包含节点，则会进一步处理这些节点，并在满足任何嵌套筛选条件时将其包括在内。

o If any selection nodes are present in the sibling set, then all of them are included in the filter output. /  如果兄弟节点集中存在任何选择节点，则所有选择节点都将包含在过滤器输出中。

o Otherwise (i.e., there are no selection or containment nodes in the filter sibling set), all the nodes defined at this level in the underlying data model (and their subtrees, if any) are returned in the filter output. /  否则（即，过滤器同级集合中没有选择或包含节点），在基础数据模型（及其子树，如果有的话）中在该级别定义的所有节点都将在过滤器输出中返回。

If any of the sibling content match node tests are 'false', then no further filter processing is performed on that sibling set, and none of the sibling subtrees are selected by the filter, including the content match node(s). / 如果任何同级内容匹配节点测试为“false”，则不会对该同级集执行进一步的筛选处理，并且筛选器不会选择任何同级子树，包括内容匹配节点。

Example:

```
     <filter type="subtree">
       <top xmlns="http://example.com/schema/1.2/config">
         <users>
           <user>
             <name>fred</name>
           </user>
         </users>
       </top>
     </filter>
        
```

```
   In this example, the <users> and <user> nodes are both containment
   nodes, and <name> is a content match node.  Since no sibling nodes of
   <name> are specified (and therefore no containment or selection
   nodes), all of the sibling nodes of <name> are returned in the filter
        
```

output. Only 'user' nodes in the 'http://example.com/schema/1.2/config' namespace that match the element hierarchy and for which the \<name> element is equal to 'fred' will be included in the filter output.

输出仅“用户”节点位于http://example.com/schema/1.2/config'与元素层次结构匹配且\<name>元素等于'fred'的命名空间将包含在筛选器输出中。

### **6.3. 子树过滤处理**

The filter output (the set of selected nodes) is initially empty.

过滤器输出（所选节点集）最初为空。

Each subtree filter can contain one or more data model fragments, which represent portions of the data model that should be selected (with all child nodes) in the filter output.

每个子树筛选器都可以包含一个或多个数据模型片段，这些片段表示应在筛选器输出中选择（与所有子节点一起）的数据模型部分。

Each subtree data fragment is compared by the server to the internal data models supported by the server. If the entire subtree data-fragment filter (starting from the root to the innermost element specified in the filter) exactly matches a corresponding portion of the supported data model, then that node and all its children are included in the result data.

服务器将每个子树数据片段与服务器支持的内部数据模型进行比较。如果整个子树数据片段过滤器（从根到过滤器中指定的最内层元素）完全匹配受支持数据模型的相应部分，则该节点及其所有子节点都将包含在结果数据中。

The server processes all nodes with the same parent node (sibling set) together, starting from the root to the leaf nodes. The root elements in the filter are considered in the same sibling set (assuming they are in the same namespace), even though they do not have a common parent.

服务器一起处理具有相同父节点（同级节点集）的所有节点，从根节点到叶节点。筛选器中的根元素被视为在同一个同级集中（假设它们位于同一命名空间中），即使它们没有公共父级。

For each sibling set, the server determines which nodes are included (or potentially included) in the filter output, and which sibling subtrees are excluded (pruned) from the filter output. The server first determines which types of nodes are present in the sibling set and processes the nodes according to the rules for their type. If any nodes in the sibling set are selected, then the process is recursively applied to the sibling sets of each selected node. The algorithm continues until all sibling sets in all subtrees specified in the filter have been processed.

对于每个同级集，服务器确定过滤器输出中包括（或可能包括）哪些节点，以及从过滤器输出中排除（修剪）哪些同级子树。服务器首先确定同级集中存在哪些类型的节点，并根据其类型的规则处理这些节点。如果选择了同级节点集中的任何节点，则该过程将递归应用于每个选定节点的同级节点集。该算法将继续，直到处理完筛选器中指定的所有子树中的所有同级集。





### **6.4. 子树过滤示例**

#### **6.4.1. No Filter  无过滤器**

Leaving out the filter on the get operation returns the entire data model.

在get操作中省略过滤器将返回整个数据模型。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get/>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <!-- ... entire set of data returned ... -->
       </data>
     </rpc-reply>
        
```

#### **6.4.2. Empty Filter  空过滤器**

An empty filter will select nothing because no content match or selection nodes are present. This is not an error. The filter type attribute used in these examples is discussed further in Section 7.1.

空筛选器将不选择任何内容，因为不存在内容匹配或选择节点。这不是一个错误。第7.1节将进一步讨论这些示例中使用的过滤器类型属性。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get>
         <filter type="subtree">
         </filter>
       </get>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
       </data>
     </rpc-reply>
        
```

#### **6.4.3. Select the Entire \<users> Subtree  / 选择整个\<users>子树**

The filter in this example contains one selection node (\<users>), so just that subtree is selected by the filter. This example represents the fully-populated \<users> data model in most of the filter examples that follow. In a real data model, the \<company-info> would not likely be returned with the list of users for a particular host or network.

本例中的过滤器包含一个选择节点（\<users>），因此过滤器仅选择该子树。这个例子代表了后面大多数过滤器例子中完全填充的\<users>数据模型。在实际数据模型中，\<company info>不可能与特定主机或网络的用户列表一起返回。

NOTE: The filtering and configuration examples used in this document appear in the namespace "http://example.com/schema/1.2/config". The root element of this namespace is \<top>. The \<top> element and its descendents represent an example configuration data model only.

注意：本文档中使用的筛选和配置示例出现在命名空间中“http://example.com/schema/1.2/config". 此命名空间的根元素是\<top>。\<top>元素及其子元素仅代表一个示例配置数据模型。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
        
```

```
           <top xmlns="http://example.com/schema/1.2/config">
             <users/>
           </top>
         </filter>
       </get-config>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
             <user>
               <name>root</name>
               <type>superuser</type>
               <full-name>Charlie Root</full-name>
               <company-info>
                 <dept>1</dept>
                 <id>1</id>
               </company-info>
             </user>
             <user>
               <name>fred</name>
               <type>admin</type>
               <full-name>Fred Flintstone</full-name>
               <company-info>
                 <dept>2</dept>
                 <id>2</id>
               </company-info>
             </user>
             <user>
               <name>barney</name>
               <type>admin</type>
               <full-name>Barney Rubble</full-name>
               <company-info>
                 <dept>2</dept>
                 <id>3</id>
               </company-info>
             </user>
           </users>
         </top>
       </data>
     </rpc-reply>
        
```

The following filter request would have produced the same result, but only because the container \<users> defines one child element (\<user>).

以下筛选器请求将产生相同的结果，但这只是因为容器\<users>定义了一个子元素（\<user>）。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users>
               <user/>
             </users>
           </top>
         </filter>
       </get-config>
     </rpc>
        
```



#### **6.4.4. 选择\<users>子树中的所有\<name>元素**

This filter contains two containment nodes (\<users>, \<user>) and one selector node (\<name>). All instances of the \<name> element in the same sibling set are selected in the filter output. The manager may need to know that \<name> is used as an instance identifier in this particular data structure, but the server does not need to know that meta-data in order to process the request.

此筛选器包含两个包含节点（\<users>，\<user>）和一个选择器节点（\<name>）。在过滤器输出中选择同一同级集中\<name>元素的所有实例。管理器可能需要知道\<name>在这个特定的数据结构中被用作实例标识符，但是服务器不需要知道元数据来处理请求。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users>
               <user>
                 <name/>
               </user>
             </users>
           </top>
         </filter>
       </get-config>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
        
```

```
             <user>
               <name>root</name>
             </user>
             <user>
               <name>fred</name>
             </user>
             <user>
               <name>barney</name>
             </user>
           </users>
         </top>
       </data>
     </rpc-reply>
        
```

#### **6.4.5. One Specific \<user> Entry / 一个特定的\<user>条目**

This filter contains two containment nodes (\<users>, \<user>) and one content match node (\<name>). All instances of the sibling set containing \<name> for which the value of \<name> equals "fred" are selected in the filter output.

此筛选器包含两个包含节点（\<users>，\<user>）和一个内容匹配节点（\<name>）。在过滤器输出中选择包含\<name>的同级集合的所有实例，其中\<name>的值等于“fred”。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users>
               <user>
                 <name>fred</name>
               </user>
             </users>
           </top>
         </filter>
       </get-config>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
             <user>
               <name>fred</name>
               <type>admin</type>
               <full-name>Fred Flintstone</full-name>
        
```

```
               <company-info>
                 <dept>2</dept>
                 <id>2</id>
               </company-info>
             </user>
           </users>
         </top>
       </data>
     </rpc-reply>
        
```

#### **6.4.6. Specific Elements from a Specific \<user> Entry / 特定\<user>条目中的特定元素**

This filter contains two containment nodes (\<users>, \<user>), one content match node (\<name>), and two selector nodes (\<type>, \<full-name>). All instances of the \<type> and \<full-name> elements in the same sibling set containing \<name> for which the value of \<name> equals "fred" are selected in the filter output. The \<company-info> element is not included because the sibling set contains selection nodes.

此筛选器包含两个包含节点（\<users>，\<user>），一个内容匹配节点（\<name>），和两个选择器节点（\<type>，\<full name>）。在过滤器输出中选择同一同级集合中包含\<name>且\<name>值等于“fred”的\<type>和\<full name>元素的所有实例。不包括\<company info>元素，因为同级集合包含选择节点。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users>
               <user>
                 <name>fred</name>
                 <type/>
                 <full-name/>
               </user>
             </users>
           </top>
         </filter>
       </get-config>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
             <user>
               <name>fred</name>
               <type>admin</type>
               <full-name>Fred Flintstone</full-name>
             </user>
           </users>
         </top>
       </data>
     </rpc-reply>
```

#### **6.4.7. 多子树**

This filter contains three subtrees (name=root, fred, barney).

此筛选器包含三个子树（name=root、fred、barney）。

The "root" subtree filter contains two containment nodes (\<users>, \<user>), one content match node (\<name>), and one selector node (\<company-info>). The subtree selection criteria is met, and just the company-info subtree for "root" is selected in the filter output.

“根”子树筛选器包含两个包含节点（\<users>，\<user>）、一个内容匹配节点（\<name>）和一个选择器节点（\<company info>）。满足子树选择条件，并且仅在过滤器输出中选择“根”的公司信息子树。

The "fred" subtree filter contains three containment nodes (\<users>, \<user>, \<company-info>), one content match node (\<name>), and one selector node (\<id>). The subtree selection criteria is met, and just the \<id> element within the company-info subtree for "fred" is selected in the filter output.

“fred”子树筛选器包含三个包含节点（\<users>、\<user>、\<company info>）、一个内容匹配节点（\<name>）和一个选择器节点（\<id>）。满足子树选择标准，并且在过滤器输出中仅选择公司信息子树中“fred”的\<id>元素。

The "barney" subtree filter contains three containment nodes (\<users>, \<user>, \<company-info>), two content match nodes (\<name>, \<type>), and one selector node (\<dept>). The subtree selection criteria is not met because user "barney" is not a "superuser", and the entire subtree for "barney" (including its parent \<user> entry) is excluded from the filter output.

“barney”子树筛选器包含三个包含节点（\<users>、\<users>、\<company info>）、两个内容匹配节点（\<name>、\<type>）和一个选择器节点（\<dept>）。未满足子树选择条件，因为用户“barney”不是“超级用户”，并且“barney”的整个子树（包括其父\<user>条目）从过滤器输出中排除。

```
 <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users>
               <user>
                 <name>root</name>
                 <company-info/>
               </user>
               <user>
                 <name>fred</name>
                 <company-info>
                   <id/>
                 </company-info>
               </user>
              
                <user>
                 <name>barney</name>
                 <type>superuser</type>
                 <company-info>
                   <dept/>
                 </company-info>
               </user>
             </users>
           </top>
         </filter>
       </get-config>
     </rpc>
     
     
      <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
             <user>
               <name>root</name>
               <company-info>
                 <dept>1</dept>
                 <id>1</id>
               </company-info>
             </user>
             <user>
               <name>fred</name>
               <company-info>
                 <id>2</id>
               </company-info>
             </user>
           </users>
         </top>
       </data>
     </rpc-reply>
```

#### **6.4.8. 具有属性命名的元素**

In this example, the filter contains one containment node (\<interfaces>), one attribute match expression (ifName), and one selector node (\<interface>). All instances of the \<interface> subtree that have an ifName attribute equal to "eth0" are selected in the filter output. The filter data elements and attributes must be qualified because the ifName attribute will not be considered part of the 'schema/1.2' namespace if it is unqualified.

在此示例中，筛选器包含一个包含节点（\<interface>）、一个属性匹配表达式（ifName）和一个选择器节点（\<interface>）。在过滤器输出中选择ifName属性等于“eth0”的\<interface>子树的所有实例。筛选器数据元素和属性必须是限定的，因为如果ifName属性是非限定的，则不会将其视为“schema/1.2”命名空间的一部分。

```
     <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get>
         <filter type="subtree">
           <t:top xmlns:t="http://example.com/schema/1.2/stats">
             <t:interfaces>
               <t:interface t:ifName="eth0"/>
             </t:interfaces>
           </t:top>
         </filter>
       </get>
     </rpc>
     
     
     <rpc-reply message-id="101"
         xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <t:top xmlns:t="http://example.com/schema/1.2/stats">
           <t:interfaces>
             <t:interface t:ifName="eth0">
               <t:ifInOctets>45621</t:ifInOctets>
               <t:ifOutOctets>774344</t:ifOutOctets>
             </t:interface>
           </t:interfaces>
         </t:top>
       </data>
     </rpc-reply>
```

如果ifName是子节点而不是属性，那么下面的请求将产生类似的结果

```
    <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/stats">
             <interfaces>
               <interface>
                 <ifName>eth0</ifName>
               </interface>
             </interfaces>
           </top>
         </filter>
       </get>
     </rpc>
```

## **7. 协议操作**

The NETCONF protocol provides a small set of low-level operations to manage device configurations and retrieve device state information. The base protocol provides operations to retrieve, configure, copy, and delete configuration datastores. Additional operations are provided, based on the capabilities advertised by the device.

NETCONF协议提供了一小部分低级操作，用于管理设备配置和检索设备状态信息。基本协议提供检索、配置、复制和删除配置数据存储的操作。根据设备公布的功能，提供附加操作。

The base protocol includes the following protocol operations:

基本协议包括以下协议操作：

o get  收到

o get-config  获取配置

o edit-config  编辑配置

o copy-config  复制配置

o delete-config 删除配置

o lock  锁

o unlock  解锁

o close-session &#x20;

o kill-session

A protocol operation may fail for various reasons, including "operation not supported". An initiator should not assume that any operation will always succeed. The return values in any RPC reply should be checked for error responses.

协议操作可能因各种原因而失败，包括“不支持操作”。发起者不应假定任何操作总是成功的。应检查任何RPC回复中的返回值是否有错误响应。

The syntax and XML encoding of the protocol operations are formally defined in the XML schema in Appendix B. The following sections describe the semantics of each protocol operation.

协议操作的语法和XML编码在附录B的XML模式中正式定义。以下各节描述了每个协议操作的语义。

### **7.1. \<get config>**

Description:Retrieve all or part of a specified configuration.检索指定配置的全部或部分。

Parameters:



source :&#x20;

Name of the configuration datastore being queried, such as \<running/>.正在查询的配置数据存储的名称，例如\<running/>。



filter / 过滤器:

The filter element identifies the portions of the device configuration to retrieve. If this element is unspecified, the entire configuration is returned.过滤器元件标识要检索的设备配置部分。如果未指定此元素，则返回整个配置。

The filter element may optionally contain a "type" attribute. This attribute indicates the type of filtering syntax used within the filter element. The default filtering mechanism in NETCONF is referred to as subtree filtering and is described in Section 6. The value "subtree" explicitly identifies this type of filtering.

过滤器元素可以选择性地包含“类型”属性。此属性指示筛选器元素中使用的筛选语法的类型。NETCONF中的默认过滤机制称为子树过滤，第6节对此进行了描述。值“subtree”明确标识这种类型的筛选。

If the NETCONF peer supports the :xpath capability (Section 8.9), the value "xpath" may be used to indicate that the select attribute on the filter element contains an XPath expression.

如果NETCONF对等方支持：xpath功能（第8.9节），则值“xpath”可用于指示过滤器元素上的select属性包含xpath表达式。



Positive Response / 积极回应：

If the device can satisfy the request, the server sends an \<rpc-reply> element containing a \<data> element with the results of the query.

如果设备能够满足请求，服务器将发送一个\<rpc reply>元素，其中包含一个\<data>元素以及查询结果。



Negative Response / 否定回答：

An \<rpc-error> element is included in the \<rpc-reply> if the request cannot be completed for any reason.如果由于任何原因无法完成请求，则\<rpc error>元素将包含在\<rpc reply>中。



Example: To retrieve the entire \<users> subtree / 要检索整个\<users>子树，请执行以下操作：

```
   <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <top xmlns="http://example.com/schema/1.2/config">
             <users/>
           </top>
           </filter>
       </get-config>
     </rpc>
        
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <data>
         <top xmlns="http://example.com/schema/1.2/config">
           <users>
             <user>
               <name>root</name>
               <type>superuser</type>
               <full-name>Charlie Root</full-name>
               <company-info>
                 <dept>1</dept>
                 <id>1</id>
               </company-info>
             </user>
             <!-- additional <user> elements appear here... -->
           </users>
         </top>
       </data>
     </rpc-reply>
        
```

如果配置有多种格式可用，例如 XML 和文本，则可以使用 XML 命名空间来指定所需的格式。 在以下示例中，客户端使用特定命名空间中的特定元素 (\<config-text>) 向服务器指示希望以替代格式接收配置。 服务器可能支持任意数量的不同格式或配置数据视图，客户端使用 \<filter> 参数在它们之间进行选择

```
    <rpc message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
       <get-config>
         <source>
           <running/>
         </source>
         <filter type="subtree">
           <!-- request a text version of the configuration -->
           <config-text xmlns="http://example.com/text/1.2/config"/>
         </filter>
       </get-config>
     </rpc>
        
```

```
     <rpc-reply message-id="101"
          xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
        
```

```
       <data>
         <config-text xmlns="http://example.com/text/1.2/config">
           <!-- configuration text... -->
         </config-text>
       </data>
     </rpc-reply>
```

第6节包含子树过滤的其他示例。



### **7.2. <编辑配置>**

Description:

The \<edit-config> operation loads all or part of a specified configuration to the specified target configuration. This operation allows the new configuration to be expressed in several ways, such as using a local file, a remote file, or inline. If the target configuration does not exist, it will be created. If a NETCONF peer supports the :url capability (Section 8.8), the \<url> element can appear instead of the \<config> parameter and should identify a local configuration file.

\<edit config>操作将指定配置的全部或部分加载到指定的目标配置。此操作允许以多种方式表示新配置，例如使用本地文件、远程文件或内联文件。如果目标配置不存在，将创建它。如果NETCONF对等机支持：url功能（第8.8节），则可以显示\<url>元素而不是\<config>参数，并且应该标识本地配置文件。

The device analyzes the source and target configurations and performs the requested changes. The target configuration is not necessarily replaced, as with the \<copy-config> message. Instead, the target configuration is changed in accordance with the source's data and requested operations.

设备分析源和目标配置，并执行请求的更改。与\<copy config>消息一样，不必替换目标配置。相反，目标配置会根据源的数据和请求的操作进行更改。







### **7.3. \<copy config>**

### **7.4. <删除配置>**

### **7.5. \<lock>**



## **8. 能力**

This section defines a set of capabilities that a client or a server MAY implement. Each peer advertises its capabilities by sending them during an initial capabilities exchange. Each peer needs to understand only those capabilities that it might use and MUST ignore any capability received from the other peer that it does not require or does not understand.

本节定义了客户机或服务器可以实现的一组功能。每个对等方通过在初始功能交换期间发送功能来宣传其功能。每个对等方只需要了解它可能使用的那些功能，并且必须忽略从另一个对等方收到的它不需要或不了解的任何功能。

Additional capabilities can be defined using the template in Appendix C. Future capability definitions may be published as standards by standards bodies or published as proprietary extensions.

可使用附录C中的模板定义其他能力。未来的能力定义可由标准机构作为标准发布，或作为专有扩展发布。

A NETCONF capability is identified with a URI. The base capabilities are defined using URNs following the method described in RFC 3553 \[6]. Capabilities defined in this document have the following format:

NETCONF功能由URI标识。基本功能是按照RFC 3553\[6]中描述的方法使用URN定义的。本文档中定义的功能具有以下格式：

```
      urn:ietf:params:netconf:capability:{name}:1.0
        
```

where {name} is the name of the capability. Capabilities are often referenced in discussions and email using the shorthand :{name}. For example, the foo capability would have the formal name "urn:ietf:params:netconf:capability:foo:1.0" and be called ":foo". The shorthand form MUST NOT be used inside the protocol.

其中{name}是功能的名称。讨论和电子邮件中经常使用缩写：{name}引用功能。例如，foo功能的正式名称为“urn:ietf:params:netconf:capability:foo:1.0”，并称为“：foo”。协议中不得使用速记形式。



### **8.1. 能力交换  / Capabilities Exchange**

Capabilities are advertised in messages sent by each peer during session establishment. When the NETCONF session is opened, each peer (both client and server) MUST send a \<hello> element containing a list of that peer's capabilities. Each peer MUST send at least the base NETCONF capability, "urn:ietf:params:netconf:base:1.0".

在会话建立期间，在每个对等方发送的消息中公布功能。打开NETCONF会话时，每个对等方（客户端和服务器）都必须发送一个\<hello>元素，其中包含该对等方的功能列表。每个对等方必须至少发送基本NETCONF功能“urn:ietf:params:NETCONF:base:1.0”。

A server sending the \<hello> element MUST include a \<session-id> element containing the session ID for this NETCONF session. A client sending the \<hello> element MUST NOT include a \<session-id> element.

发送\<hello>元素的服务器必须包含包含此NETCONF会话会话id的\<session id>元素。发送\<hello>元素的客户端不得包含\<session id>元素。

A server receiving a \<session-id> element MUST NOT continue the NETCONF session. Similarly, a client that does not receive a \<session-id> element in the server's \<hello> message MUST NOT continue the NETCONF session. In both cases, the underlying transport should be closed.

接收\<session id>元素的服务器不能继续NETCONF会话。类似地，在服务器的\<hello>消息中未接收到\<session id>元素的客户端不得继续NETCONF会话。在这两种情况下，底层传输都应该关闭。

In the following example, a server advertises the base NETCONF capability, one NETCONF capability defined in the base NETCONF document, and one implementation-specific capability.

在下面的示例中，一个服务器公布基本NETCONF功能、一个在基本NETCONF文档中定义的NETCONF功能和一个特定于实现的功能。

```
<hello xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
     <capabilities>
       <capability>
         urn:ietf:params:netconf:base:1.0
       </capability>
       <capability>
         urn:ietf:params:netconf:capability:startup:1.0
       </capability>
       <capability>
         http://example.net/router/2.3/myfeature
       </capability>
     </capabilities>
     <session-id>4</session-id>
   </hello>
        
```

Each peer sends its \<hello> element simultaneously as soon as the connection is open. A peer MUST NOT wait to receive the capability set from the other side before sending its own set.

一旦连接打开，每个对等方都会同时发送其\<hello>元素。对等方在发送自己的能力集之前，不能等待从另一方接收能力集。

###

### **8.2. 可写运行能力**

#### **8.2.1. Description  描述**

The :writable-running capability indicates that the device supports direct writes to the \<running> configuration datastore. In other words, the device supports edit-config and copy-config operations where the \<running> configuration is the target.

：writable running功能表示设备支持直接写入\<running>配置数据存储。换句话说，设备支持以\<running>配置为目标的编辑配置和复制配置操作。

#### **8.2.2. Dependencies  依赖关系**

None.

#### **8.2.3. Capability Identifier 能力标识符**

The :writable-running capability is identified by the following capability string:

可写运行功能由以下功能字符串标识：

```
      urn:ietf:params:netconf:capability:writable-running:1.0
        
```

#### **8.2.4. New Operations  新业务**

None.

#### **8.2.5. Modifications to Existing Operations  对现有业务的修改**

**8.2.5.1. \<edit-config> <编辑配置>**

The :writable-running capability modifies the \<edit-config> operation to accept the \<running> element as a \<target>.  / writable running功能修改\<edit config>操作以接受\<running>元素作为\<target>。

**8.2.5.2. \<copy-config>**

The :writable-running capability modifies the \<copy-config> operation to accept the \<running> element as a \<target>.

### **8.3. 候选配置能力**



#### **8.3.1. Description**

The candidate configuration capability, :candidate, indicates that the device supports a candidate configuration datastore, which is used to hold configuration data that can be manipulated without impacting the device's current configuration. The candidate configuration is a full configuration data set that serves as a work place for creating and manipulating configuration data. Additions, deletions, and changes may be made to this data to construct the desired configuration data. A \<commit> operation may be performed at any time that causes the device's running configuration to be set to the value of the candidate configuration.

候选配置功能：candidate表示设备支持候选配置数据存储，该存储用于保存配置数据，这些数据可以在不影响设备当前配置的情况下进行操作。候选配置是一个完整的配置数据集，用作创建和操作配置数据的工作场所。可以对该数据进行添加、删除和更改，以构建所需的配置数据。任何时候都可以执行\<commit>操作，从而将设备的运行配置设置为候选配置的值。

The \<commit> operation effectively sets the running configuration to the current contents of the candidate configuration. While it could be modeled as a simple copy, it is done as a distinct operation for a number of reasons. In keeping high-level concepts as first class operations, we allow developers to see more clearly both what the client is requesting and what the server must perform. This keeps the intentions more obvious, the special cases less complex, and the interactions between operations more straightforward. For example, the :confirmed-commit capability (Section 8.4) would make no sense as a "copy confirmed" operation.

\<commit>操作有效地将正在运行的配置设置为候选配置的当前内容。虽然它可以建模为一个简单的副本，但出于许多原因，它是作为一个独特的操作来完成的。在将高级概念保持为第一类操作的过程中，我们允许开发人员更清楚地看到客户机正在请求什么以及服务器必须执行什么。这使得意图更加明显，特殊情况不那么复杂，操作之间的交互更加直观。例如：确认提交功能（第8.4节）作为“复制确认”操作毫无意义。

The candidate configuration may be shared among multiple sessions. Unless a client has specific information that the candidate configuration is not shared, it must assume that other sessions may be able to modify the candidate configuration at the same time. It is therefore prudent for a client to lock the candidate configuration before modifying it.

候选配置可以在多个会话之间共享。除非客户机具有未共享候选配置的特定信息，否则它必须假设其他会话可以同时修改候选配置。因此，客户机在修改候选配置之前锁定该配置是谨慎的。

The client can discard any uncommitted changes to the candidate configuration by executing the \<discard-changes> operation. This operation reverts the contents of the candidate configuration to the contents of the running configuration.

客户端可以通过执行\<discard changes>操作放弃对候选配置的任何未提交的更改。此操作将候选配置的内容还原为正在运行的配置的内容





### **8.4. 确认提交能力**

#### **8.4.1. 描述**

The :confirmed-commit capability indicates that the server will support the \<confirmed> and \<confirm-timeout> parameters for the \<commit> protocol operation. See Section 8.3 for further details on the \<commit> operation.

：confirm commit功能表示服务器将支持\<commit>协议操作的\<confirm>和\<confirm timeout>参数。有关\<commit>操作的更多详细信息，请参见第8.3节。

A confirmed commit operation MUST be reverted if a follow-up commit (called the "confirming commit") is not issued within 600 seconds (10 minutes). The timeout period can be adjusted with the \<confirm-timeout> element. The confirming commit can itself include a \<confirmed> parameter.

如果后续提交（称为“确认提交”）未在600秒（10分钟）内发出，则必须还原确认提交操作。可以使用\<confirm timeout>元素调整超时时间。确认提交本身可以包含一个\<confirm>参数。

If the session issuing the confirmed commit is terminated for any reason before the confirm timeout expires, the server MUST restore the configuration to its state before the confirmed commit was issued.

如果发出确认提交的会话在确认超时过期之前因任何原因终止，服务器必须将配置恢复到发出确认提交之前的状态。

If the device reboots for any reason before the confirm timeout expires, the server MUST restore the configuration to its state before the confirmed commit was issued.

如果设备在确认超时过期之前因任何原因重新启动，服务器必须将配置恢复到发出确认提交之前的状态。

If a confirming commit is not issued, the device will revert its configuration to the state prior to the issuance of the confirmed commit. Note that any commit operation, including a commit which introduces additional changes to the configuration, will serve as a confirming commit. Thus to cancel a confirmed commit and revert changes without waiting for the confirm timeout to expire, the manager can explicitly restore the configuration to its state before the confirmed commit was issued.

如果未发出确认提交，则设备将其配置恢复到发出确认提交之前的状态。请注意，任何提交操作（包括对配置引入额外更改的提交）都将用作确认提交。因此，要取消确认的提交并在不等待确认超时过期的情况下恢复更改，管理器可以显式地将配置恢复到发出确认的提交之前的状态。

For shared configurations, this feature can cause other configuration changes (for example, via other NETCONF sessions) to be inadvertently altered or removed, unless the configuration locking feature is used (in other words, the lock is obtained before the edit-config operation is started). Therefore, it is strongly suggested that in order to use this feature with shared configuration databases, configuration locking should also be used.

对于共享配置，此功能可能会导致其他配置更改（例如，通过其他NETCONF会话）被意外更改或删除，除非使用了配置锁定功能（换句话说，锁定是在开始编辑配置操作之前获得的）。因此，强烈建议，为了在共享配置数据库中使用此功能，还应使用配置锁定。



### **8.5. 错误回滚功能**

#### **8.5.1. Description. 描述**

This capability indicates that the server will support the 'rollback-on-error' value in the \<error-option> parameter to the \<edit-config> operation.

此功能表示服务器将支持\<edit config>操作的\<error option>参数中的“rollback on error”值。

For shared configurations, this feature can cause other configuration changes (for example, via other NETCONF sessions) to be inadvertently altered or removed, unless the configuration locking feature is used (in other words, the lock is obtained before the edit-config operation is started). Therefore, it is strongly suggested that in order to use this feature with shared configuration databases, configuration locking also be used.

对于共享配置，此功能可能会导致其他配置更改（例如，通过其他NETCONF会话）被意外更改或删除，除非使用了配置锁定功能（换句话说，锁定是在开始编辑配置操作之前获得的）。因此，强烈建议为了在共享配置数据库中使用此功能，还应使用配置锁定。





### **8.6. 验证能力**

#### **8.6.1. Description**



Validation consists of checking a candidate configuration for syntactical and semantic errors before applying the configuration to the device.

验证包括在将配置应用于设备之前检查候选配置的语法和语义错误。

If this capability is advertised, the device supports the \<validate> protocol operation and checks at least for syntax errors. In addition, this capability supports the test-option parameter to the \<edit-config> operation and, when it is provided, checks at least for syntax errors.

如果公布此功能，则设备支持\<validate>协议操作，并至少检查语法错误。此外，该功能支持\<edit config>操作的test option参数，并且在提供该参数时，至少检查语法错误。





### **8.7. 独特的启动能力**

#### **8.7.1. 描述**

The device supports separate running and startup configuration datastores. Operations that affect the running configuration will not be automatically copied to the startup configuration. An explicit \<copy-config> operation from the \<running> to the \<startup> must be invoked to update the startup configuration to the current contents of the running configuration. NETCONF protocol operations refer to the startup datastore using the \<startup> element.

该设备支持单独的运行和启动配置数据存储。影响运行配置的操作不会自动复制到启动配置。必须调用从\<running>到\<startup>的显式\<copy config>操作，以将启动配置更新为运行配置的当前内容。NETCONF协议操作是指使用\<startup>元素的启动数据存储。

### **8.8. URL功能**

#### **8.8.1. Description**

The NETCONF peer has the ability to accept the \<url> element in \<source> and \<target> parameters. The capability is further identified by URL arguments indicating the URL schemes supported.

NETCONF对等方能够接受\<source>和\<target>参数中的\<url>元素。该功能通过指示支持的URL方案的URL参数进一步标识。







### **8.9. XPath功能**

#### **8.9.1. 描述**

The XPath capability indicates that the NETCONF peer supports the use of XPath expressions in the \<filter> element. XPath is described in \[2].

XPath功能表明NETCONF对等方支持在\<filter>元素中使用XPath表达式。\[2]中描述了XPath。

The XPath expression must return a node-set.

XPath表达式必须返回节点集。

The XPath expression is evaluated in a context where the context node is the root node, and the set of namespace declarations are those in scope on the filter element, including the default namespace.

XPath表达式在上下文中求值，其中上下文节点是根节点，命名空间声明集是过滤器元素范围内的声明，包括默认命名空间。





[https://rfc2cn.com/rfc4741.html](https://rfc2cn.com/rfc4741.html)
