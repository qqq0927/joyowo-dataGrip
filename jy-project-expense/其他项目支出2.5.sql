
ALTER TABLE `jy-project-expense`.expense_form_push_bill_record
    ADD COLUMN subject_name VARCHAR(64) NULL COMMENT '科目名称'
        AFTER bill_confirm_month,
    ADD COLUMN subject_type VARCHAR(32) NULL COMMENT '科目类型 T(com.joyowo.bill.api.enums.SubjectTypeEnum)'
        AFTER subject_name;

SELECT * FROM `smarthr-workflow`.proc where id = 1082687856781385777;
SELECT * FROM `smarthr-workflow`.node_config where proc_id = 1082687856781385777;
SELECT * from `smarthr-workflow`.approval_role where approval_role_name ='财务运营总监';

update `smarthr-workflow`.`proc` set bpmn_content='<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema" expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.flowable.org/processdef">
  <process id="proc1082687856781385777" name="proc1082687856781385777" isExecutable="true">
    <startEvent id="startEvent1"></startEvent>
    <userTask id="staff1" name="项目负责人"></userTask>
    <sequenceFlow id="sid-8CC829E5-038E-46BA-83BD-37C342925DA8" sourceRef="startEvent1" targetRef="staff1"></sequenceFlow>
    <exclusiveGateway id="sid-52E84169-B627-4509-ACCB-94B48759B440" name="是否抄送财务审核"></exclusiveGateway>
    <sequenceFlow id="sid-26061C29-F1D5-4DB4-9A3E-6DFD13C24D81" sourceRef="startEvent1" targetRef="sid-52E84169-B627-4509-ACCB-94B48759B440"></sequenceFlow>
    <serviceTask id="cc9" name="抄送财务审核（BPO报销）" flowable:delegateExpression="${ copyTaskExecution }"></serviceTask>
    <exclusiveGateway id="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8" name="是否垫付？"></exclusiveGateway>
    <exclusiveGateway id="sid-32B6FE4A-667D-41C2-872D-D99512DFE753" name="是否超额？"></exclusiveGateway>
    <exclusiveGateway id="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB" name="按项目负责人的一级部门不同走不同分支"></exclusiveGateway>
    <exclusiveGateway id="sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7" name="按项目负责人的一级部门不同走不同分支"></exclusiveGateway>
    <exclusiveGateway id="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D" name="按项目负责人的一级部门不同走不同分支"></exclusiveGateway>
    <exclusiveGateway id="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93" default="sid-E02533BB-9D47-4870-AA54-71FFD5D81ED1"></exclusiveGateway>
    <exclusiveGateway id="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579" default="sid-12E51BB7-BFED-412B-A11E-EA6BE9265D33"></exclusiveGateway>
    <exclusiveGateway id="sid-5058D3F2-2396-412F-9AE1-F06925FA4119" default="sid-22E4227D-3F17-4FEE-BFC4-8B1C0B06CC07"></exclusiveGateway>
    <userTask id="multilevel9" name="逐级审批至二级部门负责人"></userTask>
    <userTask id="multilevel8" name="逐级审批至一级部门负责人"></userTask>
    <userTask id="multilevel10" name="逐级审批至一级部门负责人"></userTask>
    <sequenceFlow id="sid-30BD6E9B-D9CA-44D0-8FB7-CFE5CD7CB2DD" sourceRef="multilevel8" targetRef="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93"></sequenceFlow>
    <sequenceFlow id="sid-B98D48D3-4F45-468E-9098-551E26DAF851" sourceRef="multilevel9" targetRef="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579"></sequenceFlow>
    <sequenceFlow id="sid-4984E7A8-23DC-4F14-8F01-A296A5259DAC" sourceRef="multilevel10" targetRef="sid-5058D3F2-2396-412F-9AE1-F06925FA4119"></sequenceFlow>
    <exclusiveGateway id="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F" default="sid-6856F681-ADA4-427F-AA48-7C5C73C5AABF"></exclusiveGateway>
    <exclusiveGateway id="sid-762F2F52-0694-4661-8BBB-267B9764F641" default="sid-3AB25B69-9F68-41A8-A70B-1F23DF2857F4"></exclusiveGateway>
    <userTask id="multilevel11" name="逐级审批至一级部门负责人"></userTask>
    <userTask id="multilevel12" name="逐级审批至二级部门负责人"></userTask>
    <sequenceFlow id="sid-BC56F20A-6DE2-4617-82E7-8E2577277F04" sourceRef="multilevel11" targetRef="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F"></sequenceFlow>
    <sequenceFlow id="sid-EB6280AD-63A1-4CFD-BA9C-52CF6B9D67ED" sourceRef="multilevel12" targetRef="sid-762F2F52-0694-4661-8BBB-267B9764F641"></sequenceFlow>
    <exclusiveGateway id="sid-C65DBBFE-EFF7-4E91-929A-69C414287242" default="sid-17A928C2-F591-40D7-8938-B0B5A1A6839B"></exclusiveGateway>
    <exclusiveGateway id="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE" default="sid-A2B3E778-1524-45B1-93DB-A5B5A1BAC3E0"></exclusiveGateway>
    <exclusiveGateway id="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5" default="sid-AC88D606-48E9-482B-9A69-AD80AF55356C"></exclusiveGateway>
    <userTask id="multilevel13" name="逐级审批至一级部门负责人"></userTask>
    <sequenceFlow id="sid-7D0A728D-2930-400F-AC1D-7E21BFEF2381" sourceRef="multilevel13" targetRef="sid-C65DBBFE-EFF7-4E91-929A-69C414287242"></sequenceFlow>
    <userTask id="multilevel16" name="逐级审批至四级部门负责人"></userTask>
    <sequenceFlow id="sid-7CE1E52D-9402-45B0-948D-916E5A3C3C63" sourceRef="multilevel16" targetRef="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE"></sequenceFlow>
    <userTask id="multilevel17" name="逐级审批至五级部门负责人"></userTask>
    <sequenceFlow id="sid-E605A596-98C8-48D2-8316-DB56CBAE46E1" sourceRef="multilevel17" targetRef="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5"></sequenceFlow>
    <userTask id="role9" name="助理总裁 （富晨晨）"></userTask>
    <sequenceFlow id="sid-E02533BB-9D47-4870-AA54-71FFD5D81ED1" sourceRef="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93" targetRef="role9"></sequenceFlow>
    <userTask id="role8" name="境内业务COO （宋文涛）"></userTask>
    <sequenceFlow id="sid-12E51BB7-BFED-412B-A11E-EA6BE9265D33" sourceRef="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579" targetRef="role8"></sequenceFlow>
    <sequenceFlow id="sid-22E4227D-3F17-4FEE-BFC4-8B1C0B06CC07" sourceRef="sid-5058D3F2-2396-412F-9AE1-F06925FA4119" targetRef="role8"></sequenceFlow>
    <userTask id="role2" name="CEO"></userTask>
    <sequenceFlow id="sid-8E9D7303-7AFA-48EB-AE39-E8B67A73D868" sourceRef="role9" targetRef="role2"></sequenceFlow>
    <sequenceFlow id="sid-C75BA6DD-2190-4A61-BCD2-309E87A5CC5C" sourceRef="role8" targetRef="role2"></sequenceFlow>
    <userTask id="role3" name="财务审核（BPO报销）"></userTask>
    <sequenceFlow id="sid-FEAD462A-ABFC-4587-8078-DE3BC7C7D24C" sourceRef="role2" targetRef="role3"></sequenceFlow>
    <sequenceFlow id="sid-6856F681-ADA4-427F-AA48-7C5C73C5AABF" sourceRef="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F" targetRef="role3"></sequenceFlow>
    <sequenceFlow id="sid-3AB25B69-9F68-41A8-A70B-1F23DF2857F4" sourceRef="sid-762F2F52-0694-4661-8BBB-267B9764F641" targetRef="role3"></sequenceFlow>
    <sequenceFlow id="sid-17A928C2-F591-40D7-8938-B0B5A1A6839B" sourceRef="sid-C65DBBFE-EFF7-4E91-929A-69C414287242" targetRef="role3"></sequenceFlow>
    <sequenceFlow id="sid-A2B3E778-1524-45B1-93DB-A5B5A1BAC3E0" sourceRef="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE" targetRef="role3"></sequenceFlow>
    <sequenceFlow id="sid-AC88D606-48E9-482B-9A69-AD80AF55356C" sourceRef="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5" targetRef="role3"></sequenceFlow>
    <userTask id="role4" name="财务副总监（集团）"></userTask>
    <sequenceFlow id="sid-145FC0B0-60F7-4836-AADC-19C24569C818" sourceRef="role3" targetRef="role4"></sequenceFlow>
    <serviceTask id="cc3" name="抄送BPO报销出纳" flowable:delegateExpression="${ copyTaskExecution }"></serviceTask>
    <sequenceFlow id="sid-8C450395-A747-4043-A914-677036335523" sourceRef="role4" targetRef="cc3"></sequenceFlow>
    <serviceTask id="cc4" name="抄送BPO报销薪税" flowable:delegateExpression="${ copyTaskExecution }"></serviceTask>
    <sequenceFlow id="sid-EE8731BA-DF06-41EE-895B-AD16D2FC5706" sourceRef="cc3" targetRef="cc4"></sequenceFlow>
    <endEvent id="sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B"></endEvent>
    <sequenceFlow id="sid-C8A34C3E-EFA3-46AA-8D06-42B472C5DA42" sourceRef="cc4" targetRef="sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B"></sequenceFlow>
    <sequenceFlow id="sid-E68275B1-9849-45D9-BBAC-3B4953843DAF" sourceRef="cc9" targetRef="sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B"></sequenceFlow>
    <sequenceFlow id="sid-BA1E60CE-9DEA-4665-840B-8DFE4D7A6048" name="是" sourceRef="sid-52E84169-B627-4509-ACCB-94B48759B440" targetRef="cc9">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ isFinancialReviewRequired }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-770C78EE-A74F-4757-882F-BAABCAD97C67" name="否" sourceRef="sid-52E84169-B627-4509-ACCB-94B48759B440" targetRef="sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ !isFinancialReviewRequired }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-90976C01-4CEC-48DD-93DB-B0140B4ECD9B" name="否" sourceRef="sid-32B6FE4A-667D-41C2-872D-D99512DFE753" targetRef="sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ !isOvertQuota }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-7C0C7EA0-1AC2-4A69-A36D-C1D9CACEE1F7" name="是" sourceRef="sid-32B6FE4A-667D-41C2-872D-D99512DFE753" targetRef="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ isOvertQuota }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-18F3B4CC-98C3-4BFB-BA18-4C5FCF093F7C" name="AI BPO事业部或精工事业部或战略客户部" sourceRef="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB" targetRef="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${splitOverAs}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-905FD66F-6547-4649-93D3-D8AE13CD7AB6" name="集团大区" sourceRef="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB" targetRef="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${splitOverRegion}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-AFAD3838-A421-4F82-976A-B3640B05506A" name="集团项目部或公共事业一部或【其他部门】" sourceRef="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB" targetRef="sid-5058D3F2-2396-412F-9AE1-F06925FA4119">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${splitOverPo}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-F528F810-6464-4A90-8069-A233D0473371" name="集团项目部 或AI BPO事业部 或精工事业部 或战略客户部 或公共事业一部 或【其他部门】" sourceRef="sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7" targetRef="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${splitNormalAll}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-47DB00CD-1146-4710-8FD2-937ABFE32E77" name="集团大区" sourceRef="sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7" targetRef="sid-762F2F52-0694-4661-8BBB-267B9764F641">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${splitNormalRegion}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-68310D7C-9773-4ED5-A506-CBA667340B8D" name="集团项目部或AI BPO事业部或精工事业部" sourceRef="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D" targetRef="sid-C65DBBFE-EFF7-4E91-929A-69C414287242">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${noSplitPa}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-96614352-43DA-4ADD-9DC8-4A9916D65116" name="战略客户部  或公共事业一部 或【其他部门】" sourceRef="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D" targetRef="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${noSplitSo}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-C7407D7E-6052-42DF-B93B-D1DF588EFB19" name="集团大区" sourceRef="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D" targetRef="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${noSplitRegion}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-309ACD4F-677F-4A53-880C-B44111AC7590" sourceRef="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93" targetRef="multilevel8">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel8", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-E55D4B34-8DE0-4D69-A456-B0B69CD0E83B" sourceRef="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579" targetRef="multilevel9">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel9", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-247484C0-8123-4DDE-853A-0E0B8062D437" sourceRef="sid-5058D3F2-2396-412F-9AE1-F06925FA4119" targetRef="multilevel10">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel10", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-6A8AB972-331F-4F49-9718-F70D9876E9DD" sourceRef="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F" targetRef="multilevel11">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel11", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-1C90E71D-CEF3-4C72-BADD-35A753E8EFF9" sourceRef="sid-762F2F52-0694-4661-8BBB-267B9764F641" targetRef="multilevel12">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel12", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-55EB6147-E0B4-4A29-9E17-170FC377493D" sourceRef="sid-C65DBBFE-EFF7-4E91-929A-69C414287242" targetRef="multilevel13">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel13", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-E03EA179-3A76-4961-B11B-D49ED91917D4" sourceRef="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE" targetRef="multilevel16">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel16", execution) }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-75858312-3D00-486B-AAD2-DE2A246D635B" sourceRef="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5" targetRef="multilevel17">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ multilevelCallback.goOn("multilevel17", execution) }]]></conditionExpression>
    </sequenceFlow>
    <exclusiveGateway id="sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8" name="项目负责人一级部门是否为战略客户部？"></exclusiveGateway>
    <sequenceFlow id="sid-6D9071E8-46EA-4D86-83FF-EF4A50475967" sourceRef="staff1" targetRef="sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8"></sequenceFlow>
    <userTask id="role10" name="财务运营总监"></userTask>
    <sequenceFlow id="sid-A1BC5088-9D06-4B2E-A0FA-57BC6520C45A" sourceRef="role10" targetRef="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8"></sequenceFlow>
    <sequenceFlow id="sid-54572824-4765-447C-8AA1-75C9B94319E5" name="是" sourceRef="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8" targetRef="sid-32B6FE4A-667D-41C2-872D-D99512DFE753">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ isAdvance }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-DD988CA8-3A65-4096-8131-4A791D0BBE97" name="否" sourceRef="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8" targetRef="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ !isAdvance }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-8D613D69-44AD-46F9-A558-D146A109E076" name="是" sourceRef="sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8" targetRef="role10">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ leaderStrategicCustomerFlag }]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="sid-0C1F924C-EE7B-41F9-BF76-1B341307A97D" name="否" sourceRef="sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8" targetRef="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${ !leaderStrategicCustomerFlag }]]></conditionExpression>
    </sequenceFlow>
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_proc1082687856781385777">
    <bpmndi:BPMNPlane bpmnElement="proc1082687856781385777" id="BPMNPlane_proc1082687856781385777">
      <bpmndi:BPMNShape bpmnElement="startEvent1" id="BPMNShape_startEvent1">
        <omgdc:Bounds height="30.0" width="30.0" x="1505.5555539203115" y="82.30452987141258"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="staff1" id="BPMNShape_staff1">
        <omgdc:Bounds height="79.99999999999997" width="100.0" x="1470.5555539203115" y="226.33745714638465"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-52E84169-B627-4509-ACCB-94B48759B440" id="BPMNShape_sid-52E84169-B627-4509-ACCB-94B48759B440">
        <omgdc:Bounds height="40.0" width="40.0" x="451.10879198649525" y="608.2040578399209"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="cc9" id="BPMNShape_cc9">
        <omgdc:Bounds height="80.0" width="100.0" x="421.10879198649525" y="908.270685645125"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8" id="BPMNShape_sid-7DF183BF-17EC-4842-AAF9-043C8D5BB1B8">
        <omgdc:Bounds height="40.0" width="40.0" x="1500.5555539203115" y="699.588503907007"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-32B6FE4A-667D-41C2-872D-D99512DFE753" id="BPMNShape_sid-32B6FE4A-667D-41C2-872D-D99512DFE753">
        <omgdc:Bounds height="40.0" width="40.0" x="1500.0" y="814.4900267486446"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB" id="BPMNShape_sid-7357929B-A9AE-482B-A4FF-3ED66CA968FB">
        <omgdc:Bounds height="40.0" width="40.0" x="975.0" y="952.7607123937696"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7" id="BPMNShape_sid-9E3F9DEB-25B1-45E9-87F9-0D13145200B7">
        <omgdc:Bounds height="40.0" width="40.0" x="1500.0" y="952.7607123937696"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D" id="BPMNShape_sid-8272CAEE-31B5-4511-9A73-ABA3E84F131D">
        <omgdc:Bounds height="40.0" width="40.0" x="2175.0" y="952.7607123937696"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-4483C2A1-E326-4938-B9A7-B14A1031DF93" id="BPMNShape_sid-4483C2A1-E326-4938-B9A7-B14A1031DF93">
        <omgdc:Bounds height="40.0" width="40.0" x="720.5555539203116" y="1131.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579" id="BPMNShape_sid-BE0DC2EC-FBF3-40D0-B4DA-A22A6AB15579">
        <omgdc:Bounds height="40.0" width="40.0" x="975.5555539203116" y="1131.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-5058D3F2-2396-412F-9AE1-F06925FA4119" id="BPMNShape_sid-5058D3F2-2396-412F-9AE1-F06925FA4119">
        <omgdc:Bounds height="40.0" width="40.0" x="1230.5555539203115" y="1131.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel9" id="BPMNShape_multilevel9">
        <omgdc:Bounds height="80.0" width="100.0" x="825.5555539203116" y="1111.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel8" id="BPMNShape_multilevel8">
        <omgdc:Bounds height="80.0" width="100.0" x="555.5555539203116" y="1111.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel10" id="BPMNShape_multilevel10">
        <omgdc:Bounds height="80.0" width="100.0" x="1069.9588883283636" y="1111.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-65778B96-DF3B-45B7-828D-8C4B631FC29F" id="BPMNShape_sid-65778B96-DF3B-45B7-828D-8C4B631FC29F">
        <omgdc:Bounds height="40.0" width="40.0" x="1500.5555539203115" y="1131.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-762F2F52-0694-4661-8BBB-267B9764F641" id="BPMNShape_sid-762F2F52-0694-4661-8BBB-267B9764F641">
        <omgdc:Bounds height="40.0" width="40.0" x="1763.5555539203115" y="1126.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel11" id="BPMNShape_multilevel11">
        <omgdc:Bounds height="80.0" width="100.0" x="1334.5555539203115" y="1111.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel12" id="BPMNShape_multilevel12">
        <omgdc:Bounds height="80.0" width="100.0" x="1582.5555539203115" y="1106.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-C65DBBFE-EFF7-4E91-929A-69C414287242" id="BPMNShape_sid-C65DBBFE-EFF7-4E91-929A-69C414287242">
        <omgdc:Bounds height="40.0" width="40.0" x="1965.5555539203115" y="1123.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE" id="BPMNShape_sid-9A19F60B-6BDD-40B6-96C0-BB563616F3DE">
        <omgdc:Bounds height="40.0" width="40.0" x="2175.5555539203115" y="1123.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5" id="BPMNShape_sid-DA555C2C-C05D-4764-8907-19E7A9EE79C5">
        <omgdc:Bounds height="40.0" width="40.0" x="2385.5555539203115" y="1123.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel13" id="BPMNShape_multilevel13">
        <omgdc:Bounds height="80.0" width="100.0" x="1815.5555539203115" y="1103.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel16" id="BPMNShape_multilevel16">
        <omgdc:Bounds height="80.0" width="100.0" x="2025.5555539203115" y="1103.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="multilevel17" id="BPMNShape_multilevel17">
        <omgdc:Bounds height="80.0" width="100.0" x="2231.5555539203115" y="1103.7037016323948"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role9" id="BPMNShape_role9">
        <omgdc:Bounds height="80.0" width="100.0" x="690.5555539203116" y="1344.9108741279038"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role8" id="BPMNShape_role8">
        <omgdc:Bounds height="80.0" width="100.0" x="1069.9588883283636" y="1346.5020935212447"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role2" id="BPMNShape_role2">
        <omgdc:Bounds height="80.0" width="100.0" x="873.1824767243445" y="1561.6461361226236"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role3" id="BPMNShape_role3">
        <omgdc:Bounds height="80.0" width="100.0" x="1470.5555539203115" y="1857.942443659709"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role4" id="BPMNShape_role4">
        <omgdc:Bounds height="80.0" width="100.0" x="1470.5555539203115" y="2021.1797612380105"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="cc3" id="BPMNShape_cc3">
        <omgdc:Bounds height="80.0" width="100.0" x="1469.1475113578636" y="2162.9770136294364"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="cc4" id="BPMNShape_cc4">
        <omgdc:Bounds height="80.0" width="100.0" x="1469.1475113578636" y="2313.360842281525"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B" id="BPMNShape_sid-E1E97B28-58E3-496F-B509-FD67C3EA2F7B">
        <omgdc:Bounds height="28.0" width="28.0" x="1505.1475113578636" y="2498.7655117210206"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8" id="BPMNShape_sid-BECF3DAB-61D0-4D7E-B844-46F9D3CF8BB8">
        <omgdc:Bounds height="40.0" width="40.0" x="1499.1475113578636" y="370.3703844213566"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="role10" id="BPMNShape_role10">
        <omgdc:Bounds height="80.0" width="100.0" x="1470.5555539203115" y="473.25104676062233"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNEdge bpmnElement="sid-905FD66F-6547-4649-93D3-D8AE13CD7AB6" id="BPMNEdge_sid-905FD66F-6547-4649-93D3-D8AE13CD7AB6">
        <omgdi:waypoint x="995.0617459089926" y="992.6434468107768"></omgdi:waypoint>
        <omgdi:waypoint x="995.4936532596672" y="1131.7214729716504"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-EB6280AD-63A1-4CFD-BA9C-52CF6B9D67ED" id="BPMNEdge_sid-EB6280AD-63A1-4CFD-BA9C-52CF6B9D67ED">
        <omgdi:waypoint x="1682.5055539203115" y="1146.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1763.5555539203115" y="1146.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-E605A596-98C8-48D2-8316-DB56CBAE46E1" id="BPMNEdge_sid-E605A596-98C8-48D2-8316-DB56CBAE46E1">
        <omgdi:waypoint x="2331.5055539199534" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="2385.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-AC88D606-48E9-482B-9A69-AD80AF55356C" id="BPMNEdge_sid-AC88D606-48E9-482B-9A69-AD80AF55356C">
        <omgdi:waypoint x="2405.571451448649" y="1163.6360188091376"></omgdi:waypoint>
        <omgdi:waypoint x="2406.0" y="1701.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="1701.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.4427181272772" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-C75BA6DD-2190-4A61-BCD2-309E87A5CC5C" id="BPMNEdge_sid-C75BA6DD-2190-4A61-BCD2-309E87A5CC5C">
        <omgdi:waypoint x="1083.3738341061357" y="1426.4520935212447"></omgdi:waypoint>
        <omgdi:waypoint x="959.7217996287947" y="1561.6461361226236"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-B98D48D3-4F45-468E-9098-551E26DAF851" id="BPMNEdge_sid-B98D48D3-4F45-468E-9098-551E26DAF851">
        <omgdi:waypoint x="925.505553920071" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="975.5555539203116" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-8D613D69-44AD-46F9-A558-D146A109E076" id="BPMNEdge_sid-8D613D69-44AD-46F9-A558-D146A109E076">
        <omgdi:waypoint x="1519.7870813742093" y="409.6732485342197"></omgdi:waypoint>
        <omgdi:waypoint x="1520.258761095337" y="473.25104676062233"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-BC56F20A-6DE2-4617-82E7-8E2577277F04" id="BPMNEdge_sid-BC56F20A-6DE2-4617-82E7-8E2577277F04">
        <omgdi:waypoint x="1434.5055539196676" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1500.5555539203115" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-54572824-4765-447C-8AA1-75C9B94319E5" id="BPMNEdge_sid-54572824-4765-447C-8AA1-75C9B94319E5">
        <omgdi:waypoint x="1520.4593183432655" y="739.4425089189036"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0959949881035" y="814.5862623256907"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-6A8AB972-331F-4F49-9718-F70D9876E9DD" id="BPMNEdge_sid-6A8AB972-331F-4F49-9718-F70D9876E9DD">
        <omgdi:waypoint x="1500.5555539203115" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1434.5055539202017" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-0C1F924C-EE7B-41F9-BF76-1B341307A97D" id="BPMNEdge_sid-0C1F924C-EE7B-41F9-BF76-1B341307A97D">
        <omgdi:waypoint x="1538.5928521486362" y="390.8703844213566"></omgdi:waypoint>
        <omgdi:waypoint x="1722.908203125" y="390.8703844213566"></omgdi:waypoint>
        <omgdi:waypoint x="1722.908203125" y="606.3100408146125"></omgdi:waypoint>
        <omgdi:waypoint x="1519.6475113578636" y="606.3100408146125"></omgdi:waypoint>
        <omgdi:waypoint x="1520.3965084083675" y="699.7069984759404"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-12E51BB7-BFED-412B-A11E-EA6BE9265D33" id="BPMNEdge_sid-12E51BB7-BFED-412B-A11E-EA6BE9265D33">
        <omgdi:waypoint x="995.6249655972839" y="1171.5765415741332"></omgdi:waypoint>
        <omgdi:waypoint x="996.0" y="1279.0"></omgdi:waypoint>
        <omgdi:waypoint x="1119.0" y="1279.0"></omgdi:waypoint>
        <omgdi:waypoint x="1119.6020996196212" y="1346.5020935212447"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-DD988CA8-3A65-4096-8131-4A791D0BBE97" id="BPMNEdge_sid-DD988CA8-3A65-4096-8131-4A791D0BBE97">
        <omgdi:waypoint x="1540.5040751443148" y="719.588503907007"></omgdi:waypoint>
        <omgdi:waypoint x="2195.0" y="719.588503907007"></omgdi:waypoint>
        <omgdi:waypoint x="2195.0" y="952.7607123937696"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-FEAD462A-ABFC-4587-8078-DE3BC7C7D24C" id="BPMNEdge_sid-FEAD462A-ABFC-4587-8078-DE3BC7C7D24C">
        <omgdi:waypoint x="923.1104610290907" y="1641.5961361226236"></omgdi:waypoint>
        <omgdi:waypoint x="923.0" y="1703.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="1703.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.4415604954047" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-4984E7A8-23DC-4F14-8F01-A296A5259DAC" id="BPMNEdge_sid-4984E7A8-23DC-4F14-8F01-A296A5259DAC">
        <omgdi:waypoint x="1169.9088883282793" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1230.5555539203115" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-E68275B1-9849-45D9-BBAC-3B4953843DAF" id="BPMNEdge_sid-E68275B1-9849-45D9-BBAC-3B4953843DAF">
        <omgdi:waypoint x="471.10602854047306" y="988.220685645125"></omgdi:waypoint>
        <omgdi:waypoint x="471.0" y="2523.0"></omgdi:waypoint>
        <omgdi:waypoint x="1505.1481498166058" y="2512.9017183136407"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-C8A34C3E-EFA3-46AA-8D06-42B472C5DA42" id="BPMNEdge_sid-C8A34C3E-EFA3-46AA-8D06-42B472C5DA42">
        <omgdi:waypoint x="1519.1475113578636" y="2393.3108422815253"></omgdi:waypoint>
        <omgdi:waypoint x="1519.1475113578636" y="2498.7655117210206"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-8E9D7303-7AFA-48EB-AE39-E8B67A73D868" id="BPMNEdge_sid-8E9D7303-7AFA-48EB-AE39-E8B67A73D868">
        <omgdi:waypoint x="774.2184913623918" y="1424.8608741279038"></omgdi:waypoint>
        <omgdi:waypoint x="889.4774079462917" y="1561.6461361226236"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-AFAD3838-A421-4F82-976A-B3640B05506A" id="BPMNEdge_sid-AFAD3838-A421-4F82-976A-B3640B05506A">
        <omgdi:waypoint x="1014.9274857461835" y="972.7793425881825"></omgdi:waypoint>
        <omgdi:waypoint x="1251.0" y="973.0"></omgdi:waypoint>
        <omgdi:waypoint x="1250.6050475902323" y="1131.753319346601"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-68310D7C-9773-4ED5-A506-CBA667340B8D" id="BPMNEdge_sid-68310D7C-9773-4ED5-A506-CBA667340B8D">
        <omgdi:waypoint x="2175.1178930560504" y="972.8783107172126"></omgdi:waypoint>
        <omgdi:waypoint x="1986.0" y="974.0"></omgdi:waypoint>
        <omgdi:waypoint x="1985.6076655618956" y="1123.755943879597"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-EE8731BA-DF06-41EE-895B-AD16D2FC5706" id="BPMNEdge_sid-EE8731BA-DF06-41EE-895B-AD16D2FC5706">
        <omgdi:waypoint x="1519.1475113578636" y="2242.9270136294367"></omgdi:waypoint>
        <omgdi:waypoint x="1519.1475113578636" y="2313.360842281525"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-7CE1E52D-9402-45B0-948D-916E5A3C3C63" id="BPMNEdge_sid-7CE1E52D-9402-45B0-948D-916E5A3C3C63">
        <omgdi:waypoint x="2125.505553920071" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="2175.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-E55D4B34-8DE0-4D69-A456-B0B69CD0E83B" id="BPMNEdge_sid-E55D4B34-8DE0-4D69-A456-B0B69CD0E83B">
        <omgdi:waypoint x="975.5555539203116" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="925.5055539200507" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-145FC0B0-60F7-4836-AADC-19C24569C818" id="BPMNEdge_sid-145FC0B0-60F7-4836-AADC-19C24569C818">
        <omgdi:waypoint x="1520.5555539203115" y="1937.892443659709"></omgdi:waypoint>
        <omgdi:waypoint x="1520.5555539203115" y="2021.1797612380105"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-1C90E71D-CEF3-4C72-BADD-35A753E8EFF9" id="BPMNEdge_sid-1C90E71D-CEF3-4C72-BADD-35A753E8EFF9">
        <omgdi:waypoint x="1763.5555539203115" y="1146.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1682.5055539199327" y="1146.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-96614352-43DA-4ADD-9DC8-4A9916D65116" id="BPMNEdge_sid-96614352-43DA-4ADD-9DC8-4A9916D65116">
        <omgdi:waypoint x="2195.064626209098" y="992.6403108595383"></omgdi:waypoint>
        <omgdi:waypoint x="2195.4907657407643" y="1123.7246325014696"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-A2B3E778-1524-45B1-93DB-A5B5A1BAC3E0" id="BPMNEdge_sid-A2B3E778-1524-45B1-93DB-A5B5A1BAC3E0">
        <omgdi:waypoint x="2195.5713946454644" y="1163.6360819800427"></omgdi:waypoint>
        <omgdi:waypoint x="2196.0" y="1703.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="1703.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.4415604954047" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-247484C0-8123-4DDE-853A-0E0B8062D437" id="BPMNEdge_sid-247484C0-8123-4DDE-853A-0E0B8062D437">
        <omgdi:waypoint x="1230.5555539203115" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1169.9088883277714" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-7D0A728D-2930-400F-AC1D-7E21BFEF2381" id="BPMNEdge_sid-7D0A728D-2930-400F-AC1D-7E21BFEF2381">
        <omgdi:waypoint x="1915.505553920071" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1965.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-A1BC5088-9D06-4B2E-A0FA-57BC6520C45A" id="BPMNEdge_sid-A1BC5088-9D06-4B2E-A0FA-57BC6520C45A">
        <omgdi:waypoint x="1520.5555539203115" y="553.2010467606224"></omgdi:waypoint>
        <omgdi:waypoint x="1520.5555539203115" y="699.588503907007"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-6D9071E8-46EA-4D86-83FF-EF4A50475967" id="BPMNEdge_sid-6D9071E8-46EA-4D86-83FF-EF4A50475967">
        <omgdi:waypoint x="1520.2638904760104" y="306.28745714638467"></omgdi:waypoint>
        <omgdi:waypoint x="1519.79192549261" y="371.0151604962905"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-E02533BB-9D47-4870-AA54-71FFD5D81ED1" id="BPMNEdge_sid-E02533BB-9D47-4870-AA54-71FFD5D81ED1">
        <omgdi:waypoint x="740.5555539203116" y="1171.6494261530372"></omgdi:waypoint>
        <omgdi:waypoint x="740.5555539203116" y="1344.9108741279038"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-7C0C7EA0-1AC2-4A69-A36D-C1D9CACEE1F7" id="BPMNEdge_sid-7C0C7EA0-1AC2-4A69-A36D-C1D9CACEE1F7">
        <omgdi:waypoint x="1500.01675047961" y="834.4713764708582"></omgdi:waypoint>
        <omgdi:waypoint x="995.0" y="834.0"></omgdi:waypoint>
        <omgdi:waypoint x="995.0" y="952.7607123937696"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-8CC829E5-038E-46BA-83BD-37C342925DA8" id="BPMNEdge_sid-8CC829E5-038E-46BA-83BD-37C342925DA8">
        <omgdi:waypoint x="1520.5555539203115" y="112.25452923615032"></omgdi:waypoint>
        <omgdi:waypoint x="1520.5555539203115" y="226.33745714638465"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-8C450395-A747-4043-A914-677036335523" id="BPMNEdge_sid-8C450395-A747-4043-A914-677036335523">
        <omgdi:waypoint x="1520.2417713462771" y="2101.1297612380104"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="2132.0"></omgdi:waypoint>
        <omgdi:waypoint x="1519.0" y="2132.0"></omgdi:waypoint>
        <omgdi:waypoint x="1519.0643794534226" y="2162.9770136294364"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-E03EA179-3A76-4961-B11B-D49ED91917D4" id="BPMNEdge_sid-E03EA179-3A76-4961-B11B-D49ED91917D4">
        <omgdi:waypoint x="2175.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="2125.5055539200507" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-26061C29-F1D5-4DB4-9A3E-6DFD13C24D81" id="BPMNEdge_sid-26061C29-F1D5-4DB4-9A3E-6DFD13C24D81">
        <omgdi:waypoint x="1505.5555493006736" y="97.30452987141258"></omgdi:waypoint>
        <omgdi:waypoint x="471.0" y="97.30452987141258"></omgdi:waypoint>
        <omgdi:waypoint x="471.1046944240877" y="608.2040578399209"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-17A928C2-F591-40D7-8938-B0B5A1A6839B" id="BPMNEdge_sid-17A928C2-F591-40D7-8938-B0B5A1A6839B">
        <omgdi:waypoint x="1985.9920739018912" y="1163.215504822966"></omgdi:waypoint>
        <omgdi:waypoint x="1998.0" y="1700.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="1700.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.4432881707248" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-75858312-3D00-486B-AAD2-DE2A246D635B" id="BPMNEdge_sid-75858312-3D00-486B-AAD2-DE2A246D635B">
        <omgdi:waypoint x="2385.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="2331.5055539201608" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-6856F681-ADA4-427F-AA48-7C5C73C5AABF" id="BPMNEdge_sid-6856F681-ADA4-427F-AA48-7C5C73C5AABF">
        <omgdi:waypoint x="1520.5555539203115" y="1171.6523651079135"></omgdi:waypoint>
        <omgdi:waypoint x="1520.5555539203115" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-3AB25B69-9F68-41A8-A70B-1F23DF2857F4" id="BPMNEdge_sid-3AB25B69-9F68-41A8-A70B-1F23DF2857F4">
        <omgdi:waypoint x="1783.5715662859875" y="1166.635891098611"></omgdi:waypoint>
        <omgdi:waypoint x="1784.0" y="1700.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="1700.0"></omgdi:waypoint>
        <omgdi:waypoint x="1520.4432881707248" y="1857.942443659709"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-55EB6147-E0B4-4A29-9E17-170FC377493D" id="BPMNEdge_sid-55EB6147-E0B4-4A29-9E17-170FC377493D">
        <omgdi:waypoint x="1965.5555539203115" y="1143.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="1915.5055539200507" y="1143.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-47DB00CD-1146-4710-8FD2-937ABFE32E77" id="BPMNEdge_sid-47DB00CD-1146-4710-8FD2-937ABFE32E77">
        <omgdi:waypoint x="1539.9281671206168" y="972.7787785480783"></omgdi:waypoint>
        <omgdi:waypoint x="1784.0" y="973.0"></omgdi:waypoint>
        <omgdi:waypoint x="1783.606468612235" y="1126.7547439300622"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-C7407D7E-6052-42DF-B93B-D1DF588EFB19" id="BPMNEdge_sid-C7407D7E-6052-42DF-B93B-D1DF588EFB19">
        <omgdi:waypoint x="2214.922691836858" y="972.7833113515602"></omgdi:waypoint>
        <omgdi:waypoint x="2406.0" y="973.0"></omgdi:waypoint>
        <omgdi:waypoint x="2405.6073610792455" y="1123.7556386338324"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-770C78EE-A74F-4757-882F-BAABCAD97C67" id="BPMNEdge_sid-770C78EE-A74F-4757-882F-BAABCAD97C67">
        <omgdi:waypoint x="451.1234493053221" y="628.1846526689966"></omgdi:waypoint>
        <omgdi:waypoint x="261.0" y="628.0"></omgdi:waypoint>
        <omgdi:waypoint x="261.0" y="2525.0"></omgdi:waypoint>
        <omgdi:waypoint x="1505.148144451737" y="2512.901158367324"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-22E4227D-3F17-4FEE-BFC4-8B1C0B06CC07" id="BPMNEdge_sid-22E4227D-3F17-4FEE-BFC4-8B1C0B06CC07">
        <omgdi:waypoint x="1250.6244264387037" y="1171.5771404534598"></omgdi:waypoint>
        <omgdi:waypoint x="1251.0" y="1280.0"></omgdi:waypoint>
        <omgdi:waypoint x="1119.0" y="1280.0"></omgdi:waypoint>
        <omgdi:waypoint x="1119.5987495567545" y="1346.5020935212447"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-18F3B4CC-98C3-4BFB-BA18-4C5FCF093F7C" id="BPMNEdge_sid-18F3B4CC-98C3-4BFB-BA18-4C5FCF093F7C">
        <omgdi:waypoint x="975.0188238103153" y="972.7794891445594"></omgdi:waypoint>
        <omgdi:waypoint x="741.0" y="973.0"></omgdi:waypoint>
        <omgdi:waypoint x="740.6050475902324" y="1131.753319346601"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-309ACD4F-677F-4A53-880C-B44111AC7590" id="BPMNEdge_sid-309ACD4F-677F-4A53-880C-B44111AC7590">
        <omgdi:waypoint x="720.5555539203116" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="655.5055539203115" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-30BD6E9B-D9CA-44D0-8FB7-CFE5CD7CB2DD" id="BPMNEdge_sid-30BD6E9B-D9CA-44D0-8FB7-CFE5CD7CB2DD">
        <omgdi:waypoint x="655.5055539202442" y="1151.7037016323948"></omgdi:waypoint>
        <omgdi:waypoint x="720.5555539203116" y="1151.7037016323948"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-BA1E60CE-9DEA-4665-840B-8DFE4D7A6048" id="BPMNEdge_sid-BA1E60CE-9DEA-4665-840B-8DFE4D7A6048">
        <omgdi:waypoint x="471.10879198649525" y="648.1509422747325"></omgdi:waypoint>
        <omgdi:waypoint x="471.10879198649525" y="908.270685645125"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-F528F810-6464-4A90-8069-A233D0473371" id="BPMNEdge_sid-F528F810-6464-4A90-8069-A233D0473371">
        <omgdi:waypoint x="1520.0617459089926" y="992.6434468107768"></omgdi:waypoint>
        <omgdi:waypoint x="1520.493653259667" y="1131.7214729716504"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="sid-90976C01-4CEC-48DD-93DB-B0140B4ECD9B" id="BPMNEdge_sid-90976C01-4CEC-48DD-93DB-B0140B4ECD9B">
        <omgdi:waypoint x="1520.0" y="854.4328178517939"></omgdi:waypoint>
        <omgdi:waypoint x="1520.0" y="952.7607123937696"></omgdi:waypoint>
      </bpmndi:BPMNEdge>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>' where id = 1082687856781385777;

REPLACE INTO `smarthr-workflow`.`node_config` (id, proc_id, td_key, candidate_type, candidate_pointer, is_variable, title_force
                                              , is_countersign,  hidden_memo, create_staff_id, create_time, update_staff_id, update_time)
VALUES ('1557782943307833361', '1082687856781385777', 'role10', 'approvalRoleOrg', '1524726159789523008', '0', null
       , 0, '', -1, now(), -1, now());
