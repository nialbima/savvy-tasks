const ColumnHeaders = () => {
  return (
    <div className="border-b-4 border-gray-300/50 grid grid-cols-subgrid col-span-9 py-3 mb-2 sticky top-28 bg-black">
      <div className="col-span-5">Task</div>
      <div className="col-span-3">Due Date</div>
      <div className="col-span-1">Done?</div>
    </div>
  );
};
export default ColumnHeaders;
